from khiva.array import *
from khiva.library import *
from khiva.linalg import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)

a = Array.from_list([1, 2, 3, 4, 5], dtype.f64)
b = Array.from_list([10, 20, 30, 40, 50], dtype.f64)

print('lls')
print(lls(a, b).to_list())
print()
