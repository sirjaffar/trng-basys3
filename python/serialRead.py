import serial
from bitstring import BitArray
import matplotlib.pyplot as plt
import numpy as np
import math
import scipy.stats as stats
import scipy
from scipy.stats import norm
# plt.rcParams.update({'figure.figsize':(7,5), 'figure.dpi':100})

def nCr(n, r):
	return ((math.factorial(n)) / ((math.factorial(r))*(math.factorial((n-r)))))




serialport = serial.Serial("/dev/ttyUSB1", 9600, timeout=0)


size = 1501

data = list()
data1 = list()
chk0 = 0
chk1 = 1


while len(data)<size:
	command = serialport.read()
	c1 = BitArray(command)
	try:
		if len(c1.bin)>0 and (int((c1.bin),2)/255)!=0.0:
			# chk1 = chk0
			data.append(int((c1.bin),2)/255)
			# data1.append(int((c1.bin)[0]))
			# print(c1.bin)
	except:
		pass


from numpy import random, sqrt, log, sin, cos, pi
from pylab import show,hist,subplot,figure

# transformation function
def gaussian(u1,u2):
  z1 = sqrt(-2*log(u1))*cos(2*pi*u2)
  z2 = sqrt(-2*log(u1))*sin(2*pi*u2)
  return z1,z2

# uniformly distributed values between 0 and 1
u1 = np.array(data[1:int((size/2)+1)],dtype=float)
u2 = np.array(data[int((size/2)+1):],dtype=float)

# run the transformation
z1,z2 = gaussian(u1,u2)

# plotting the values before and after the transformation
figure()
ax1 = subplot(231) # the first row of graphs
hist(u1)     # contains the histograms of u1 and u2 



ax1.set_xlabel('random numbers')
ax1.set_ylabel('# of occurrence')
ax1.set_title('Uniform dist. samples from FPGA #1')

ax2 =subplot(232)
hist(u2)
ax2.set_xlabel('random numbers')
ax2.set_ylabel('# of occurrence')
ax2.set_title('Uniform dist. samples from FPGA #2')


ax3 = subplot(234) # the second contains
hist(z1)     # the histograms of z1 and z2
ax3.set_xlabel('random numbers')
ax3.set_ylabel('# of occurrence')
ax3.set_title('Normal dist from FPGA #1')
# _, bins, _ = hist(z1, 20, alpha=0.5)
# plt.hold(True)
# mu, sigma = scipy.stats.norm.fit(z1)
# best_fit_line = scipy.stats.norm.pdf(bins, mu, sigma)
# plt.plot(bins, best_fit_line)


ax4 = subplot(235)
hist(z2)
ax4.set_xlabel('random numbers')
ax4.set_ylabel('# of occurrence')
ax4.set_title('Normal dist from FPGA #2')

u11 = random.uniform(size=int(((size-1)/2)))
u22 = random.uniform(size=int(((size-1)/2)))

z11,z22 = gaussian(u11,u22)

# plotting the values before and after the transformation
ax5 = subplot(233) # the first row of graphs
hist(u11)     # contains the histograms of u1 and u2 
ax5.set_xlabel('random numbers')
ax5.set_ylabel('# of occurrence')
ax5.set_title('Uniform dist. samples from Numpy')


ax6 =subplot(236)
hist(z11)
ax6.set_xlabel('random numbers')
ax6.set_ylabel('# of occurrence')
ax6.set_title('Normal dist. from Numpy')
# _, bins, _ = hist(z11, 20, alpha=0.5)
# plt.hold(True)
# mu, sigma = scipy.stats.norm.fit(z11)
# best_fit_line = scipy.stats.norm.pdf(bins, mu, sigma)
# plt.plot(bins, best_fit_line)

# ax7 = subplot(247) # the second contains
# hist(z11)     # the histograms of z1 and z2

# ax8 = subplot(248)
# hist(z22)
# ax8.set_xlabel('random numbers')
# ax8.set_ylabel('# of occurrence')
# ax8.set_title('Normal dist from P-Random')




show()






# data = np.random.normal(170, 10, 250)


# d2 = np.random.randint(0, 255, 100000,dtype=int)

# # plt.hist(data, bins=50)
# # plt.hold(True)
# # plt.hist(d2)




# mean = np.mean(data)
# var = np.var(data)
# std = np.std(data)

# x = np.linspace(0,255,100)
# plt.hist(data)
# plt.hold(True)

# plt.plot(stats.norm.pdf(x, mean, std))


# plt.show()


# print(data)

# bins = len(data)
# x = np.linspace(0,bins,bins,dtype=int)




# succ = data.count(1)
# fail = data.count(0)

# succ1 = data1.count(1)
# fail1 = data1.count(0)


# pSucc = succ/bins
# pFail = fail/bins

# pSucc1 = succ1/bins
# pFail1 = fail1/bins





# y1 = list()
# y2 = list()


# for i in range(len(x)):
# 	val = nCr(bins, i)*(math.pow(pSucc, i))*(math.pow(pFail, (bins-i)))
# 	val1 = nCr(bins, i)*(math.pow(pSucc1, i))*(math.pow(pFail1, (bins-i)))
# 	y1.append(val)
# 	y2.append(val1)


# plt.plot(x, y1)
# plt.hold(True)
# plt.plot(x, y2)


# #plt.gca().set(title='Frequency Histogram', ylabel='Frequency')
# plt.show()
