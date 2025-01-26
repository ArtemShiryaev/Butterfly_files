#pragma once

#include "matrix.h"
//#include "splines.h"
#include "filters.h"


using namespace std;

static double get_torque(double theta, double dtheta, double t)
{
    auto Kp = 0.2;
    auto Kd = 0.1;
    auto ref = (t + 0.5 * sin(t))/6;
    auto dref = (1 + 0.5 * cos(t))/6;       
    auto n = int(floor(theta / _PI));
         theta = theta - _PI * n;
    

    //auto tau = Kp*(_PI/2 - theta) - Kd * dtheta;

    auto tau = 0.00286 + Kd * (dref-dtheta) + Kp * (ref - theta);
    return tau;
}