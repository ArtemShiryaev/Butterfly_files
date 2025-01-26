#pragma once

#include "matrix.h"
//#include "splines.h"
#include "filters.h"


using namespace std;
double theta0 = 0;

static double get_torque(double theta, double dtheta, double t)
{
    auto Kp = 0.001;
    auto Kd = 0.01;
    auto J = 0;
    auto f_v = 0;
    auto F = 0;
    
    
    // Desired trajectory
	
    if (theta0 == 0)
    {
        theta0 = theta;
    }
    //if (t>2)
  //  {
 //       t = t-2;
        double theta_d   =  (2*sin(3.6*t)         + 1*sin(5*t))/3     + theta0;
        double dtheta_d  =  (2*3.6*cos(3.6*t)     + 1*5*cos(5*t))/3;
        double ddtheta_d = (-2*3.6*3.6*sin(3.6*t) - 1*5*5*sin(5*t))/3;
        
        auto tau = Kp*(theta_d - theta) + Kd*(dtheta_d - dtheta) + theta_d*f_v + F*sign(dtheta_d) + ddtheta_d*J + 0.01*t;
        
        
    //}
	
    return tau;
}
