#pragma once

#include "matrix.h"
//#include "splines.h"
#include "filters.h"


using namespace std;
double theta0 = 0;

static double get_torque(double theta, double dtheta, double t)
{
    auto Kp = 0.1;
    auto Kd = 0;
    auto F = 0.0023;
    

    if (theta0 == 0)
    {
        theta0 = theta;
    }

    double theta_d = 2*sin(3.6*t) + 1*sin(6*t) + theta0;
    double dtheta_d = 2*3.6*cos(3.6*t) + 1*6*cos(6*t);
    double ddtheta_d = -2*3.6*3.6*sin(3.6*t) - 1*6*6*sin(6*t);

    auto tau = Kp*(theta_d - theta) + Kd*(dtheta_d - dtheta) + sign(dtheta)*F;// + theta_d_S*f_v;
    return tau;
}

static double desiredTrajectory(double t)
{


    double theta_d = 2*sin(3.6*t) + 1*sin(5*t) + theta0;
    return theta_d;
}

