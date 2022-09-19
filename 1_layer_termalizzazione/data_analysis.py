import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rc
rc('font',**{'family':'sans-serif','sans-serif':['Gills Sans MT']})
#for Palatino and other serif fonts use:
rc('font',**{'family':'serif','serif':['Palatino']})
rc('text', usetex=True)

timestep, time, pe, ke, temp = np.loadtxt('properties_relax.txt', usecols=range(0,5), unpack=True)
print (timestep)

def moving_av(x, y, tt):
	window = tt  #time of the window	
	y_avg = np.zeros(len(y))
	avg_mask = np.ones(window) / window
	y_avg = np.convolve(y, avg_mask, 'same')
	w_x = xrange(0,len(avg_mask))
	return y_avg


	
l = plt.plot(time, pe)
#av = plt.plot(time[40:len(pe)-40], moving_av(time, pe, 50)[40:len(ke)-40])
plt.rc('text', usetex=True)
plt.rc('font', family='serif')
plt.xlabel('Time (ps)', fontsize = 20)
plt.ylabel('Potential Energy (eV)', fontsize = 20)
#plt.title('Arm structure, 16 layers', fontsize = 20)
#plt.grid(True)
plt.xticks(fontsize = 20)
plt.yticks(fontsize = 20)
plt.xlim([0, 150])
plt.setp(l, color='b', linewidth=3.0)
#plt.setp(av, color='k', linewidth=3.0)
plt.tight_layout()
plt.savefig("armR_time_U.eps")
plt.show()

l = plt.plot(time, ke)
#av = plt.plot(time[40:len(ke)-40], moving_av(time, ke, 50)[40:len(ke)-40])
plt.rc('text', usetex=True)
plt.rc('font', family='serif')
plt.xlabel('Time (ps)', fontsize = 20)
plt.ylabel('Kinetic Energy  (eV)', fontsize = 20)
#plt.title('Arm structure, 16 layers',fontsize = 20)
plt.xticks(fontsize = 20)
plt.yticks(fontsize = 20)
#plt.grid(True)
plt.xlim([0, 150])
plt.setp(l, color='r', linewidth=3.0)
#plt.setp(av, color='k', linewidth=3.0)
plt.tight_layout()
plt.savefig("armR_time_K.eps")
plt.show()

l = plt.plot(time, temp)
#av = plt.plot(time[40:len(temp)-40], moving_av(time, temp, 50)[40:len(ke)-40])
plt.rc('text', usetex=True)
plt.rc('font', family='serif')
#plt.text(60.0,120.25, 'Mean temperature = %0.2f K' % np.mean(temp[250:]), fontsize = 20.0)
plt.xticks(fontsize = 20)
plt.yticks(fontsize = 20)
plt.xlabel('Time (ps)',fontsize = 20)
plt.ylabel('Temperature (K)', fontsize = 20)
#plt.title('Arm structure, 16 layers', fontsize = 20)
#plt.grid(True)
plt.xlim([0, 150])

plt.setp(l,  color='g', linewidth=3.0)
#plt.setp(av,  color='k', linewidth=3.0)
plt.tight_layout()
plt.savefig("armR_time_T.eps")
plt.show()

