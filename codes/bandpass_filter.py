import numpy as np
import os
from scipy.io import wavfile
from scipy.signal import butter, lfilter

audiofilename = input("Enter the audio file name: ")
lowcut = float(input("Enter the lowcut freq: "))
highcut = float(input("Enter the highcut freq: "))
#FRAME_RATE = 16000

def butter_bandpass(lowcut, highcut, fs, order=5):
    nyq = 0.5 * fs
    low = lowcut / nyq
    high = highcut / nyq
    b, a = butter(order, [low, high], btype='band')
    return b, a

def butter_bandpass_filter(data, lowcut, highcut, fs, order=5):
    b, a = butter_bandpass(lowcut, highcut, fs, order=order)
    y = lfilter(b, a, data)
    return y

def bandpass_filter(buffer):
    return butter_bandpass_filter(buffer, lowcut, highcut, FRAME_RATE, order=6)

samplerate, data = wavfile.read( '' + audiofilename + '' + '.wav')
FRAME_RATE = samplerate
assert samplerate == FRAME_RATE
filtered = np.apply_along_axis(bandpass_filter, 0, data).astype('int16')
wavfile.write(os.path.join( f'filtered_{audiofilename}' + '.wav'), samplerate, filtered)

