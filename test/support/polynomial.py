from khiva.array import *
from khiva.library import *
from khiva.polynomial import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)

a = Array.from_list([1, 2, 3, 4, 5], dtype.f64)
b = Array.from_list([10, 20, 30, 40, 50], dtype.f64)

print('polyfit')
print(polyfit(a, b, 2).to_list())
print()

print('roots')
print(roots(a).to_list())
print()
