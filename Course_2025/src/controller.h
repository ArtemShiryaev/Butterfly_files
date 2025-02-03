#pragma once

#include "matrix.h"
//#include "splines.h"
#include "filters.h"


using namespace std;

double dth = 0;


static double get_torque(double theta, double dtheta, double t)
{   
    static double theta0=theta;
    auto Kp = 0.03;
    auto w = 15.0;    
    auto eps = 0.01;
    auto tau = 1*(eps*sin(w*t));

    return tau;
}



    // auto tau = Kp*(e*sin(w*t) - dtheta);

    // double theta_prime = e * sin(w*t);
    // double delta = theta_prime - theta ;//- theta0;
    // auto tau = Kp * delta;

    //auto amp = 1.5   ; //_PI/0.5

    //au4.5o Kp 4.5 4;
    //auto Kd = 0.02;
    // - mass
    //auto Kp = 28;
    //auto Kd = 1.2;
    
    //auto Kp = -14;
    //auto Kd = 2.5;    
    
    //1
    //auto tau = 0.001*t; 
    //std::cout<<"dtheta=\t"<<dtheta<<"\n";
    //if(abs(dtheta)<=0.0001){

    //std::cout<<tau<<"\t"<<dtheta<<"\n";
    //}
    //auto tau = 0.0003*t;  

    //2
    //auto tau = -0.0001*t;
    //auto tau = -0.0003*t; 

    //3
    //auto v_ref = -0.5*t;
            
   
    //auto tau = Kd*(v_ref - dtheta) + 0.05*(dth);

    //dth = dth + (v_ref - dtheta)*0.001;
    
    
    

 
    // stabilise in point
    //auto tau = Kp*(_PI/2 - theta) - Kd * dtheta;
    //auto n = int(floor(theta / (2*_PI)));
    //double theta0 = theta + 105.872;

    //auto tau = Kp*(sin(0.2*t) - theta0) + Kd*(0.2*cos(0.2*t) - dtheta);
//auto fs = 0;
//if (dtheta<0)
    //fs = 0.00138;
    //else
    //fs = -0.00219;
    
    //auto tau = e*(sin(w*t))+fs;
    
    //auto tau = Kp*(e*sin(w*t) - theta0) + Kd*(e*w*cos(w*t) - dtheta);
    //auto r = amp * sin((w)*t);
    //auto dr = (amp*w) * cos((w)*t);
    //auto e = r - (theta - theta0);
    //auto de = dr - dtheta;
    //auto tau = Kp*e + Kd*de - fs;
    
    //auto tau = e * sin(w * t) - fs;
    //auto tau = 0.04*(r - (theta - 0.5)) + 0.004*(dr - dtheta) - fs;        //pd-controller
    //auto tau = 0.04*(r - (theta - 0.5)) - fs;                              //p-controller

    //auto tau = Kp*e + Kd*de - fs;

   //auto tau =  0.003*(sin(5*t))+0.002*(sin(4*t))+0.004*(sin(1*t)) + 0.002;// + fs;
    //auto tau = 0.005*sin(5*t) + 0.002*sin(2*t) + 0.005*sin(8*t);// + fs;
    //auto tau = -Kp*( theta - (_PI/2 - 0.5)) - Kd * dtheta + fs;
    //auto tau = -Kp*( theta - (_PI/2 - 1*(sin(2*t)) - 0.5563)) - Kd * (dtheta - 1*2*cos(2*t)) + fs;
    //auto tau = 0;
