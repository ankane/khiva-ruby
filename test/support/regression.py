from khiva.array import *
from khiva.library import *
from khiva.regression import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)

a = Array.from_list([1, 2, 3, 4, 5], dtype.f64)
b = Array.from_list([10, 20, 30, 40, 50], dtype.f64)

print('linear')
res = linear(a, b)
print(res[0].to_list())
print(res[1].to_list())
print(res[2].to_list())
print(res[3].to_list())
print(res[4].to_list())
print()
