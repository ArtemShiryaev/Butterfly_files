#pragma once

#include <memory>
#include <stdexcept>
#include <cppmisc/json.h>
#include "filters.h"
#include "servo_iface.h"


struct BflySignals
{
    double t;
    double theta;
    double dtheta;
    double torque;
};

class Butterfly
{
private:
    std::shared_ptr<ServoIfc> m_servo;



    DelayFilt   m_delay_theta;
    DelayFilt   m_delay_dtheta;


    double      m_theta, m_dtheta;

    bool        m_stop;
    int64_t     m_sync_delay;

    void measure();
    void get_signals(int64_t const& t, BflySignals& signals);

public:
    typedef std::function<bool(BflySignals&)> callback_t;

    Butterfly();
    ~Butterfly();

    void init(Json::Value const& jscfg);
    void stop();
    void start(callback_t const& cb);    
};
