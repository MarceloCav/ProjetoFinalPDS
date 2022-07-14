import numpy as np 
import matplotlib.pyplot as plt 
import soundfile as sf


audiofilename = input("Enter the audio file name: ")

signal, samplerate = sf.read( '' + audiofilename + '' + '.wav')

time = np.arange(0, len(signal) * 1/samplerate, 1/samplerate)

plt.plot(time, signal)
plt.xlabel('Time (s)')
plt.ylabel('Amplitude (V)')
plt.show()