from khiva.array import *
from khiva.clustering import *
from khiva.library import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)

a = Array.from_list([1, 2, 3, 4, 5], dtype.f64)

print('k_means')
res = k_means(a, 2)
print(res[0].to_list())
print(res[1].to_list())
print()

print('k_shape')
res = k_shape(a, 2)
print(res[0].to_list())
print(res[1].to_list())
print()
