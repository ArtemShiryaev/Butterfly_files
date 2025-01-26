#pragma once

#include <string>
#include <functional>
#include <cstdlib>
#include <sstream>
#include <cmath>
#include <chrono>
#include <thread>
#include <fstream>
#include <pthread.h>


#define throw_if(cond, excpt) if (cond) { throw excpt; }

inline void throw_runtime_error [[ noreturn ]] (std::string const& msg) { throw std::runtime_error(msg); }
inline void throw_invalid_arg [[ noreturn ]] (std::string const& msg) { throw std::invalid_argument(msg); }


/*
 * arithmetic
 */

static const double _PI_2 = acos(0.0);
static const double _PI = 2 * _PI_2;
static const double _2_PI = 2 * _PI;
static const double _4_PI = 4 * _PI;

template <typename T>
inline T clamp(T const& val, T const& minval, T const& maxval)
{
	return val < minval ? minval : 
		val > maxval ? maxval : val;
}

template <typename T>
inline bool in_diap(T const& val, T const& minval, T const& maxval)
{
    return val >= minval && val <= maxval;
}

template <typename T>
inline T square(T const& x)
{
	return x * x;
}

template <typename T>
inline T sign(T const& x)
{
	return (T)(x > 0) * (T)2 - (T)1;
}

inline double modulo(double a, double b)
{
	int n = (int)floor(a / b);
	return a - n * b;
}

inline double excess(double a, double b)
{
    long n = lround(a / b);
    return a - n * b;
}

inline double triangle(double t, double T)
{
	return fabs(modulo(t / (T * 0.25), 4.) - 2.) - 1.;
}

inline double random(double a, double b)
{
	double r = std::rand();
	return a + (b - a) * (r / RAND_MAX);
}


/*
 * string
 */

int str2int(char const* s);
int int2str(int val, char* s);

template <typename T>
inline std::string to_string(T const& v)
{
    std::stringstream ss;
    ss << v;
    return ss.str();
}


/*
 * time
 */

#ifdef _MSC_VER
#include <Windows.h>

    inline int64_t __epoch_usec()
    {
        LARGE_INTEGER n, f;
        QueryPerformanceCounter(&n);
        QueryPerformanceFrequency(&f);
        return n.QuadPart * 1000000i64 / f.QuadPart;
    }

#else
#include <sys/time.h>
#include <unistd.h>

    inline int64_t __epoch_usec()
    {
        auto epoch = std::chrono::high_resolution_clock::now().time_since_epoch();
        auto us = std::chrono::duration_cast<std::chrono::microseconds>(epoch);
        return us.count();
    }

#endif

int64_t __beginning_epoch_usec();

inline int64_t epoch_usec()
{
    return __epoch_usec() - __beginning_epoch_usec();
}

template <typename T>
inline void sleep_usec(T const& usec)
{
    if (usec <= 0)
        return;

    auto dur = std::chrono::microseconds((int64_t)usec);
    std::this_thread::sleep_for(dur);
}

inline void sleep_until(int64_t t)
{
    auto t1 = epoch_usec();
    if (t > t1)
        sleep_usec(t - t1);
}

inline int64_t sec_to_usec(double sec)
{
    return int64_t(sec * 1e+6);
}

inline double usec_to_sec(int64_t usec)
{
    return double(usec) * 1e-6;
}


/*
 *
 */
class LoopRate
{
private:
    int64_t t_prev;
    int64_t step;

public:
    LoopRate(double step) : t_prev(epoch_usec()), step(int64_t(step * 1e+6)) {}
    ~LoopRate() {}

    inline void wait()
    {
        int64_t t = epoch_usec();

        while (t < t_prev + step)
        {
            sleep_usec(t_prev + step - t);
            t = epoch_usec();
        }

        t_prev = t;
    }
};


/*
 * files
 */
int open_file(std::string const& path, std::string const& mode);
void close_file(int fd);
void write_file(std::string const& path, std::string const& data);
void write_file(std::string const& path, int val);
std::string read_file(std::string const& path);
void write_str(int f, char const* s, int len);
int read_int(int f);
void write_int(int f, int val);
bool is_file(std::string const& path);

/*
 * devices
 */
void load_device(std::string const& device_name);
bool is_device_loaded(std::string const& device_name);

/*
 * signals
 */
typedef std::function<void(void)> signal_handler_t;
typedef std::shared_ptr<signal_handler_t> ptr_signal_handler_t;

void set_sigint_handler(ptr_signal_handler_t ptr_handler);
void set_sigterm_handler(ptr_signal_handler_t ptr_handler);

/*
 *
 */

inline bool set_thread_rt_priotiy(pthread_t thread, int priotity)
{
    if (thread == pthread_t(-1))
        thread = pthread_self();

    int policy = SCHED_RR; // SCHED_FIFO;
    sched_param param;
    param.sched_priority = priotity;
    return pthread_setschedparam(thread, policy, &param) == 0;
}

inline bool clear_thread_priority(pthread_t thread)
{
    if (thread == pthread_t(-1))
        thread = pthread_self();

    int policy = SCHED_OTHER;
    sched_param param;
    param.sched_priority = 0;
    return pthread_setschedparam(thread, policy, &param) == 0;
}
