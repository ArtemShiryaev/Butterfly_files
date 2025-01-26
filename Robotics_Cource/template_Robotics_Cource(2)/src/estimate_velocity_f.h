#pragma once



using namespace std;

double dthetaF;
double dthetaF2;
double dthetaF2_h;
double dthetaF2_2h;
double Xh1;
double Xh2;

static double estimate_velocity(double theta, double theta_h, double t, double t_h, double tau )
{
    /*
    Значение производной задается формулой конечных разностей первого порядка:

    dtheta = (theta - theta_h)/h;

    dtheta  - оцененное значение производной;
    theta   - значение угла поворота в текущий момент времени t;
    theta_h - значение угла поворота в момент времени t-h;
    h       - шаг дискретизации;
    */

    auto dtheta = (theta-theta_h)/(t-t_h);

    /* Фильтр первого порядка
    W = 1/(T*s + 1)
    T = 0.004 */
    auto T = 0.004; //  постоянная времени, этим коэффициентом настраивается фильтр
    auto h = t-t_h; //  Шаг дискретизации. Время дискретизации может незначительно изменяться.


    dthetaF =  (h/(T+h))*( dtheta + (T/h) * dthetaF );

    /* Фильтр второго порядка
    W = 1/(T*s + 1)^2
    T = 0.004 */

    auto h2 = 0.001; //предположим, что шаг дискретизации постоянный

    dthetaF2 =  ( h*h/((T+h)*(T+h)) )*( dtheta + (2*T*T + 2*T*h)/(h*h) * dthetaF2_h - (T*T)/(h*h) * dthetaF2_2h); // Реализация передаточной функции W = 1/(T*s + 1)^2 в дискретной форме
    dthetaF2_2h = dthetaF2_h;
    dthetaF2_h = dthetaF;


    /* Наблюдатель Люенбергера.
        Динамика системы: J*ddth + Ftr = k*u, Ftr = K1 * sign(dth) + K2*dth, слагаемое K1 * sign(dth) - не линейно
        Т.к. динамика известна, трансформируем нелинейную динамику в линейную с помощью преобразования обратной связи
        v = k*u + K1 * sign(dth),
        Получим линейную динамику:
        J*ddth + K2*dth = v.
        Запишем динамику в пространстве состояний:
        dX = A*X + B*v,     y = C*x.
        X = [th;dth], A = [0 1; 0 -K2/J], B = [0; 1/J], C = [1,0].
        Наблюдатель имеет следующий вид:
        dXh = A*Xh + B*v + L*[th - th_h],   th_h = C*Xh.
        Xh - оценка состояния системы, th_h - оценка угла поворота мотора.
        L = [L1;L2] - постоянный, настраиваемый вектор, который определяет свойства наблюдателя
    */

    if (t < 0.1+0.01)  // Присвоение начального значения состояния наблюдателя
    {
        Xh1 = theta;
        Xh2 = dtheta;
    }

    auto J =  0.00090064;
    auto K2 = 0.0000928;
    auto K1 = 0.0023;

    auto A11 = 0;
    auto A12 = 1;
    auto A21 = 0;
    auto A22 = -K2/J;

    auto B1 = 0;
    auto B2 = 1/J;
    auto C1 = 1;
    auto C2 = 0;

    auto L1 = 100;
    auto L2 = 100;

    auto v = tau + K1*sign(Xh2);
    auto th_h = Xh1;


    //dXh(:,i) = A*Xh(:,i) + B*v + L*(th(i)-th_h(i));
    auto dXh1 = Xh2 + L1*( theta-th_h );
    auto dXh2 = A22*Xh2 + B2*v + L2*( theta-th_h );

    Xh1 = Xh1 + dXh1*h;
    Xh2 = Xh2 + dXh2*h;

    double dthetaF3 = Xh2;



    //return dtheta;
    //return dthetaF;
    //return dthetaF2;
    return  dthetaF3;
}
