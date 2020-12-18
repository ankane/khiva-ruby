from khiva.array import *
from khiva.dimensionality import *
from khiva.library import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)

a = Array.from_list([[1, 2, 3], [4, 5, 6]], dtype.f32)

print('paa')
print(paa(a, 2).to_list())
print()

print('pip')
print(pip(a, 3).to_list())
print()

print('pla_bottom_up')
print(pla_bottom_up(a, 0.1).to_list())
print()

print('pla_sliding_window')
print(pla_sliding_window(a, 0.1).to_list())
print()

print('ramer_douglas_peucker')
print(ramer_douglas_peucker(a, 0.1).to_list())
print()

print('sax')
print(sax(a, 2).to_list())
print()

print('visvalingam')
print(visvalingam(a, 2).to_list())
print()
