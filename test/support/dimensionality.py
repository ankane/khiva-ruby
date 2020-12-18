from khiva.array import *
from khiva.dimensionality import *
from khiva.library import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)

a = Array.from_list([1, 2, 3, 4, 5], dtype.f64)

print('paa')
print(paa(a, 2).to_list())
print()
