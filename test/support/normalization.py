from khiva.array import *
from khiva.library import *
from khiva.normalization import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)

a = Array.from_list([1, 2, 3, 4, 5], dtype.f32)

print('decimal_scaling_norm')
print(decimal_scaling_norm(a).to_list())
print()

print('decimal_scaling_norm_in_place')
b = a.copy()
decimal_scaling_norm_in_place(b)
print(b.to_list())
print()

print('max_min_norm')
print(max_min_norm(a).to_list())
print()

print('max_min_norm_in_place')
b = a.copy()
max_min_norm_in_place(b)
print(b.to_list())
print()

print('mean_norm')
print(mean_norm(a).to_list())
print()

print('mean_norm_in_place')
b = a.copy()
mean_norm_in_place(b)
print(b.to_list())
print()

print('znorm')
print(znorm(a).to_list())
print()

print('znorm_in_place')
b = a.copy()
znorm_in_place(b)
print(b.to_list())
print()
