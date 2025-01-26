#pragma once

#include "matrix.h"
//#include "splines.h"
#include "filters.h"


using namespace std;
double theta0 = 0;

static double get_torque(double theta, double dtheta, double t)
{
    auto Kp = 0.003;
    auto Kd = 0;
    auto J = 0;
    auto f_v = 0;
    auto F = 0;
    auto Static_friction  = 0.00303 ;
    auto Om = 3.5+0.01*t;

      if (dtheta < 0)
    {
        Static_friction  = -0.00161;
    }  
    // Desired trajectory
	
    if (theta0 == 0)
    {
        theta0 = theta;
    }
    //if (t>2)
  //  {
 //       t = t-2;
        double theta_d   =  sin(Om*t)    + theta0;
        double dtheta_d  =  (2*3*cos(3*t)     + 1*5*cos(5*t))/3  ;
        double ddtheta_d = (-2*3.6*3.6*sin(3.6*t) - 1*5*5*sin(5*t))/3;

        
        auto tau = Static_friction*(999/1000+1/1000/(1+t)) + Kp*(theta_d )  ;// + F*sign(dtheta_d) + ddtheta_d*J;
        
        
    //}
	
    return tau;
}
