import librosa
import numpy as np
import matplotlib.pyplot as plt
import librosa.display
from numpy.fft import *
import math
import wave
import struct
from scipy.io import wavfile

# Read the wav file (mono)
audiofilename = input("Enter the audio file name: ")
samplingFrequency, signalData = wavfile.read( '' + audiofilename + '' + '.wav')
print(samplingFrequency)
print(signalData)

# Plot the signal read from wav file
plt.subplot(212)
plt.specgram(signalData,Fs=samplingFrequency)
plt.xlabel('Time')
plt.ylabel('Frequency')
plt.show()