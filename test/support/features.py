from khiva.array import *
from khiva.features import *
from khiva.library import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)

a = Array.from_list([1, 2, 3, 4, 5], dtype.f64)

print('abs_energy')
print(abs_energy(a).to_list())
print()

print('absolute_sum_of_changes')
print(absolute_sum_of_changes(a).to_list())
print()

# ---

print('maximum')
print(maximum(a).to_list())
print()

print('mean')
print(mean(a).to_list())
print()

print('mean_absolute_change')
print(mean_absolute_change(a).to_list())
print()

print('mean_change')
print(mean_change(a).to_list())
print()

print('mean_second_derivative_central')
print(mean_second_derivative_central(a).to_list())
print()

print('median')
print(median(a).to_list())
print()

print('minimum')
print(minimum(a).to_list())
print()

# ---

print('skewness')
print(skewness(a).to_list())
print()

# ---

print('standard_deviation')
print(standard_deviation(a).to_list())
print()

# ---

print('sum_values')
print(sum_values(a).to_list())
print()

# ---

print('value_count')
print(value_count(a, 3).to_list())
print()

print('variance')
print(variance(a).to_list())
print()

print('variance_larger_than_standard_deviation')
print(variance_larger_than_standard_deviation(a).to_list())
print()
