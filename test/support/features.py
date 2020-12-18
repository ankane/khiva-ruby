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

print('auto_covariance')
print(auto_covariance(a).to_list())
print()

print('binned_entropy')
print(binned_entropy(a, 3).to_list())
print()

print('c3')
print(c3(a, 3).to_list())
print()

print('cid_ce')
print(cid_ce(a, True).to_list())
print()

# ---

print('count_above_mean')
print(count_above_mean(a).to_list())
print()

print('count_below_mean')
print(count_below_mean(a).to_list())
print()

# ---

print('fft_aggregated')
print(fft_aggregated(a).to_list())
print()

# ---

print('first_location_of_maximum')
print(first_location_of_maximum(a).to_list())
print()

print('first_location_of_minimum')
print(first_location_of_minimum(a).to_list())
print()

# ---

print('has_duplicate_max')
print(has_duplicate_max(a).to_list())
print()

print('has_duplicate_min')
print(has_duplicate_min(a).to_list())
print()

print('has_duplicates')
print(has_duplicates(a).to_list())
print()

print('index_mass_quantile')
print(index_mass_quantile(a, 0.5).to_list())
print()

print('kurtosis')
print(kurtosis(a).to_list())
print()

print('large_standard_deviation')
print(large_standard_deviation(a, 1).to_list())
print()

print('last_location_of_maximum')
print(last_location_of_maximum(a).to_list())
print()

print('last_location_of_minimum')
print(last_location_of_minimum(a).to_list())
print()

print('length')
print(length(a).to_list())
print()

print('linear_trend')
print(linear_trend(a))
print()

print('local_maximals')
print(local_maximals(a).to_list())
print()

print('longest_strike_above_mean')
print(longest_strike_above_mean(a).to_list())
print()

print('longest_strike_below_mean')
print(longest_strike_below_mean(a).to_list())
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

print('quantile')
q = Array.from_list([0.5], dtype.f64)
print(quantile(a, q).to_list())
print()

print('range_count')
print(range_count(a, 2, 4).to_list())
print()

print('ratio_beyond_r_sigma')
print(ratio_beyond_r_sigma(a, 1).to_list())
print()

print('ratio_value_number_to_time_series_length')
print(ratio_value_number_to_time_series_length(a).to_list())
print()

print('sample_entropy')
print(sample_entropy(a).to_list())
print()

print('skewness')
print(skewness(a).to_list())
print()

print('spkt_welch_density')
print(spkt_welch_density(a, 1).to_list())
print()

print('standard_deviation')
print(standard_deviation(a).to_list())
print()

print('sum_of_reoccurring_datapoints')
print(sum_of_reoccurring_datapoints(a).to_list())
print()

print('sum_of_reoccurring_values')
print(sum_of_reoccurring_values(a).to_list())
print()

print('sum_values')
print(sum_values(a).to_list())
print()

print('symmetry_looking')
print(symmetry_looking(a, 0.5).to_list())
print()

print('time_reversal_asymmetry_statistic')
print(time_reversal_asymmetry_statistic(a, 2).to_list())
print()

print('value_count')
print(value_count(a, 3).to_list())
print()

print('variance')
print(variance(a).to_list())
print()

print('variance_larger_than_standard_deviation')
print(variance_larger_than_standard_deviation(a).to_list())
print()
