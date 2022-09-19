import numpy as np
import matplotlib.pyplot as plt

timestep, time, pe, ke, temp = np.loadtxt('preproperties.txt', usecols=range(0,5), unpack=True)
print timestep


l = plt.plot(time, pe)
plt.xlabel('time (ps)')
plt.ylabel('Potential Energy (eV)')
plt.title('Zig Zag structure')
plt.grid(True)
plt.setp(l, color='b', linewidth=3.0)
plt.savefig("arm_time_U.eps")
plt.show()

l = plt.plot(time, ke)
plt.xlabel('time (ps)')
plt.ylabel('Kinetic Energy  (eV)')
plt.title('Zig Zag structure')
plt.grid(True)
plt.setp(l, color='r', linewidth=3.0)
plt.savefig("arm_time_K.eps")
plt.show()

l = plt.plot(time, temp)
plt.xlabel('time (ps)')
plt.ylabel('Temperature (K)')
plt.title('Zig Zag structure')
plt.grid(True)
plt.setp(l,  color='g', linewidth=3.0)
plt.savefig("arm_time_T.eps")
plt.show()

