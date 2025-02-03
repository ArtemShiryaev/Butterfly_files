#include <cppmisc/traces.h>
#include <cppmisc/argparse.h>
#include <cppmisc/signals.h>
#include "butterfly.h"
#include "controller.h"



#include <iostream>
#include <sstream>
#include <locale>
#include <iomanip>



using namespace std;



uint cur = 0;
const uint Sample = 1;
const uint delay = 0;
double tau = 0;
double tau_arr[delay];
uint count_d = 0;
bool F_full = false;




int launch(Json::Value const& jscfg)
{
    Butterfly bfly;
    bfly.init(jscfg);
    bool stop = false;
    
    auto stop_handler = [&stop, &bfly]() { stop = true; bfly.stop(); };
    SysSignals::instance().set_sigint_handler(stop_handler);
    SysSignals::instance().set_sigterm_handler(stop_handler);

    std::tm t = {};
    auto t1 =std::get_time(&t, "%Y-%b-%d %H:%M:%S");

    // Controller
    auto f = [](BflySignals& signals) {
        if (signals.t < 0.1)
            return true;

        auto n = int(floor(signals.theta / _PI));
        double theta = signals.theta - _PI * n;

        
        
        cur++;
        if (cur == Sample)
        {
            tau = get_torque(theta,signals.dtheta,signals.t);
            tau = clamp(tau, -0.1, 0.1);
            cur = 0;
        }
        
        tau_arr[count_d] = tau;
        count_d++;

        if (count_d>delay) {count_d =0;F_full = true;}

        if (F_full)
        {
            auto j = count_d+1;
            if (j>delay) j=0;
            tau = tau_arr[j];
        }




        signals.torque = tau;
    
        //info_msg("t=", signals.t, ",torque=", signals.torque, ",theta=", signals.theta, ",dtheta=", signals.dtheta);
        info_msg(",", signals.t, ",", signals.torque, ",", signals.theta, ",", signals.dtheta,"," );       


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
    //auto t2 = (get_time_usec());

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

