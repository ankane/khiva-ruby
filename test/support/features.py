from khiva.array import *
from khiva.features import *
from khiva.library import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)

a = Array.from_list([1, 2, 3, 4, 5], dtype.f64)

print('abs_energy')
print(abs_energy(a).to_list())
print()
