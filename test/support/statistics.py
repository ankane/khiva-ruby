from khiva.array import *
from khiva.library import *
from khiva.statistics import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)

a = Array.from_list([1, 2, 3, 4, 5], dtype.f64)

print('covariance')
print(covariance(a).to_list())
print()

print('kurtosis')
print(kurtosis(a).to_list())
print()

print('ljung_box')
print(ljung_box(a, 3).to_list())
print()

print('moment')
print(moment(a, 3).to_list())
print()

print('quantile')
q = Array.from_list([0.5], dtype.f64)
print(quantile(a, q).to_list())
print()

print('quantiles_cut')
print(quantiles_cut(a, 3).to_list())
print()

print('sample_stdev')
print(sample_stdev(a).to_list())
print()

print('skewness')
print(skewness(a).to_list())
print()
