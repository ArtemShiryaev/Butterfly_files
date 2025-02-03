Data_04_09_123_5_001.txt /max amplitude

auto fs = 0;
if (dtheta>0)
    fs = 0.00138;
    else
    fs = -0.00219; 
    auto tau =  0.01*(sin(15*t)) + fs;
    return tau;