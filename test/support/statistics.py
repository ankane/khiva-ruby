from khiva.array import *
from khiva.library import *
from khiva.statistics import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)

a = Array.from_list([1, 2, 3, 4, 5], dtype.f32)

print('covariance')
print(covariance(a).to_list())
print()
