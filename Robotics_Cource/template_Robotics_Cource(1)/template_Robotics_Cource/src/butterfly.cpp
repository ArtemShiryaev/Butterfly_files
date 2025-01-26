#include "butterfly.h"
#include "filters.h"

using namespace std;


Butterfly::Butterfly()
{
    m_theta = 0;
    m_dtheta = 0;
    m_stop = false;
    m_sync_delay = 0;
}

Butterfly::~Butterfly()
{
}

void Butterfly::init(Json::Value const& cfg)
{
    info_msg("initializing hardware..");

    auto const& butcfg = json_get(cfg, "controller");
    m_sync_delay = json_get<int64_t>(butcfg, "cam_delay_usec");
    m_delay_theta.init(m_sync_delay);
    m_delay_dtheta.init(m_sync_delay);

    m_servo = ServoIfc::capture_instance();
    m_servo->init(cfg);


    info_msg("done");
}

void wait_for_camera_ready()
{

}

void Butterfly::measure()
{
    int64_t t_servo;
    int status = m_servo->get_state(t_servo, m_theta, m_dtheta, true);
    if (status < 0)
        throw_runtime_error("servo disconnected");

    double theta_delayed = m_delay_theta.process(t_servo, m_theta);
    double dtheta_delayed = m_delay_dtheta.process(t_servo, m_dtheta);

    int64_t t_cam;

}

void Butterfly::stop()
{
    m_stop = true;
}

void Butterfly::get_signals(int64_t const& t, BflySignals& signals)
{
    signals.t = t * 1e-6;
    signals.theta = m_theta;
    signals.dtheta = m_dtheta;
    signals.torque = 0;
}

void Butterfly::start(callback_t const& cb)
{
    if (!m_servo)
        throw_runtime_error("Butterfly not initialized yet");

    m_servo->start();

    int status;
    int64_t t, t0;
    t0 = epoch_usec();

    while (!m_stop)
    {
        t = epoch_usec();
        measure();

        BflySignals signals;
        get_signals(t - t0, signals);
        status = cb(signals);
        if (!status)
            m_stop = true;

        m_servo->set_torque(signals.torque);
    }

    m_servo->stop();


    info_msg("stopped");
}
