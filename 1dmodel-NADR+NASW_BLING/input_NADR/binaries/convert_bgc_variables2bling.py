#!/usr/bin/env python
import struct
import sys
import numpy as np
import matplotlib.pylab as plt

def write_new_data(data,fileout):
        fid   = open(fileout, "wb")
        flatdata = data.flatten()
        for kk in np.arange(len(flatdata)):
                  tmp = struct.pack('>f',flatdata[kk])
                  #tmp = struct.pack('<f',flatdata[kk])
                  fid.write(tmp)
        fid.close()
        return None

filein = sys.argv[-1]
fileout = filein.replace('.bin','_bling.bin')

# read the original data
data = np.fromfile(filein,dtype='>f')
# units in darwin are mmol/m3, bling has mol/m3
dataout = data / 1000.
# write file in bling units
if sys.byteorder == 'little':
	dataout.byteswap(True).tofile(fileout,format='f')
else:
	dataout.tofile(fileout,format='f')

# alternative
#write_new_data(dataout,fileout)


#plt.figure()
#plt.subplot(121)
#plt.plot(data)
#plt.subplot(122)
#plt.plot(dataout)
#plt.title(filein)
#plt.show()
