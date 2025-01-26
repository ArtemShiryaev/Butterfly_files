#include <cppmisc/traces.h>
#include <cppmisc/argparse.h>
#include <cppmisc/signals.h>
#include "butterfly.h"
#include "controller.h"

using namespace std;


int launch(Json::Value const& jscfg)
{
    Butterfly bfly;
    bfly.init(jscfg);
    bool stop = false;
    auto stop_handler = [&stop, &bfly]() { stop = true; bfly.stop(); };
    SysSignals::instance().set_sigint_handler(stop_handler);
    SysSignals::instance().set_sigterm_handler(stop_handler);

    // Controller
    auto f = [](BflySignals& signals) {
        if (signals.t < 0.1)
            return true;

        auto n = int(floor(signals.theta / _PI));
        double theta = signals.theta - _PI * n;

        signals.torque = get_torque(theta,signals.dtheta,signals.t);
        
        signals.torque = clamp(signals.torque, -0.1, 0.1);
        //info_msg("t=", signals.t, ",torque=", signals.torque, ",theta=", signals.theta, ",dtheta=", signals.dtheta);
        info_msg(",", signals.t, ",", signals.torque, ",", signals.theta, ",", signals.dtheta);

        return true;
    };

    bfly.start(f);
    return 0;
}

int main(int argc, char const* 
    argv[])
{
    make_arg_list args({
        {{"-c", "--config"}, "config", "path to json config file", "", true}
    });

    int status = 0;

    try
    {
        auto&& m = args.parse(argc, argv);
        Json::Value const& cfg = json_load(m["config"]);
        traces::init(json_get(cfg, "traces"));
        launch(cfg);
    }
    catch (exception const& e)
    {
        err_msg(e.what());
        status = -1;
    }
    catch (...)
    {
        err_msg("Unknown error occured");
        status = -1;
    }

    return status;
}


/*#include <cppmisc/traces.h>
#include <cppmisc/argparse.h>
#include <cppmisc/signals.h>
#include "butterfly.h"
#include "controller.h"
#include "estimate_velocity_f.h"

using namespace std;

double theta_h;
double t_h;
double dtheta;


int launch(Json::Value const& jscfg)
{
    double dq;
    Butterfly bfly;
    bfly.init(jscfg);
    bool stop = false;
    auto stop_handler = [&stop, &bfly]() { stop = true; bfly.stop(); };
    SysSignals::instance().set_sigint_handler(stop_handler);
    SysSignals::instance().set_sigterm_handler(stop_handler);

    // Controller
    auto f = [](BflySignals& signals) {
        if (signals.t < 0.1)
            return true;



        auto n = int(floor(signals.theta / _PI));
        double theta = signals.theta - _PI * n *2;

        signals.torque = 0;
        qd = 0;

        if ((signals.t)>0.11)
        {
            signals.torque = get_torque(signals.theta,signals.dtheta,signals.t);
            dq = desiredTrajectory(signals.t);
        
            signals.torque = clamp(signals.torque, -0.1, 0.1);
        }



        dtheta = 0;
        if ( (signals.t)>0.1 )
        {
            dtheta = estimate_velocity( signals.theta, theta_h,  signals.t, t_h, signals.torque);
        }
    
        //info_msg("t=", signals.t, ",torque=", signals.torque, ",theta=", signals.theta, ",dtheta=", signals.dtheta);
        info_msg(",", signals.t, ",", signals.torque, ",", signals.theta, ",", signals.dtheta, ",", dtheta, ",", dq);

        theta_h  = signals.theta;
        t_h = signals.t;

        return true;
    };

    bfly.start(f);
    return 0;
}

int main(int argc, char const*
    argv[])
{
    make_arg_list args({
        {{"-c", "--config"}, "config", "path to json config file", "", true}
    });

    int status = 0;

    try
    {
        auto&& m = args.parse(argc, argv);
        Json::Value const& cfg = json_load(m["config"]);
        traces::init(json_get(cfg, "traces"));
        launch(cfg);
    }
    catch (exception const& e)
    {
        err_msg(e.what());
        status = -1;
    }
    catch (...)
    {
        err_msg("Unknown error occured");
        status = -1;
    }

    return status;
}*/



