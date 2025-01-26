import numpy as np
import matplotlib.pyplot as plt

data = np.genfromtxt('Data.txt',skip_header=10,skip_footer=5,delimiter=',')
signals=data[1:,1:]
t = signals[:,0]
tau = signals[:,1]
theta = signals[:,2]
Dtheta = signals[:,3]

tEnd = t[-1]

plt.figure(1)
plt.subplot(3,1,1)
plt.plot(t,theta)
plt.ylabel('theta [rad]')
plt.xlim((0,tEnd))

plt.subplot(3,1,2)
plt.plot(t,tau)
plt.ylabel('tau [Nm]')
plt.xlim((0,tEnd))

plt.subplot(3,1,3)
plt.plot(t,Dtheta)
plt.ylabel('d theta/dt [rad/s]')
plt.xlim((0,tEnd))

plt.show()
