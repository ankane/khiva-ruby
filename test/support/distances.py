from khiva.array import *
from khiva.distances import *
from khiva.library import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)
set_device(0)

a = Array.from_list([[1, 1, 1, 1, 1], [2, 2, 2, 2, 2], [3, 3, 3, 3, 3]], dtype.s64)

print('dtw')
print(dtw(a).to_list())
print()

print('euclidean')
print(euclidean(a).to_list())
print()

print('hamming')
print(hamming(a).to_list())
print()

print('manhattan')
print(manhattan(a).to_list())
print()

print('sbd')
print(sbd(a).to_list())
print()

print('squared_euclidean')
print(squared_euclidean(a).to_list())
print()
