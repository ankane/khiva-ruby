# Khiva

[Khiva](https://github.com/shapelets/khiva) - high-performance time series algorithms - for Ruby

:fire: Runs on GPUs and CPUs

[![Build Status](https://github.com/ankane/khiva-ruby/workflows/build/badge.svg?branch=master)](https://github.com/ankane/khiva-ruby/actions)

## Installation

First, [install Khiva](#khiva-installation). For Homebrew, use:

```sh
brew install khiva
```

Add this line to your application’s Gemfile:

```ruby
gem 'khiva'
```

## Getting Started

Calculate a matrix profile

```ruby
a = Khiva::Array.new([11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11])
b = Khiva::Array.new([9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9])
profile, index = Khiva::Matrix.stomp(a, b, 3)
```

Find discords

```ruby
distances, indices, subsequences = Khiva::Matrix.find_best_n_discords(profile, index, 3, 2)
```

Find motifs

```ruby
distances, indices, subsequences = Khiva::Matrix.find_best_n_motifs(profile, index, 3, 2)
```

## Examples

### Anomaly Detection

```ruby
# generate a random time series with anomalies from position 100-109
values = 1000.times.map { |i| i >= 100 && i <= 109 ? 0.5 : rand }

# calculate the matrix profile with subsequence length 10
a = Khiva::Array.new(values, type: :f32)
profile, index = Khiva::Matrix.stomp_self_join(a, 10)

# find and print the position of the most anomalous subsequence
_, _, subsequences = Khiva::Matrix.find_best_n_discords(profile, index, m, 1)
p subsequences.to_a
```

## Modules

- [Array](#array)
- [Clustering](#clustering)
- [Dimensionality](#dimensionality)
- [Distances](#distances)
- [Features](#features)
- [Library](#library)
- [Linalg](#linalg)
- [Matrix](#matrix)
- [Normalization](#normalization)
- [Polynomial](#polynomial)
- [Regression](#regression)
- [Regularization](#regularization)
- [Statistics](#statistics)

## Array

Create an array from a Ruby array

```ruby
Khiva::Array.new([1, 2, 3])
```

Specify the type - `:b8`, `:f32`, `:f64`, `:s16`, `:s32`, `:s64`, `:u8`, `:u16`, `:u32`, `:u64`

```ruby
Khiva::Array.new([1, 2, 3], type: :s64)
```

Get the type and dimensions

```ruby
a.type
a.dims
```

Perform operations on arrays

```ruby
a + b
a - b
a * b
a / b
a % b
a ** b
```

Compare arrays

```ruby
a.eq(b)
a.ne(b)
a.lt(b)
a.gt(b)
a.le(b)
a.ge(b)
```

## Clustering

k-means algorithm

```ruby
centroids, labels = Khiva::Clustering.k_means(tss, k)
```

k-Shape algorithm

```ruby
centroids, labels = Khiva::Clustering.k_shape(tss, k)
```

## Dimensionality

Piecewise Aggregate Approximation (PAA)

```ruby
Khiva::Dimensionality.paa(a, bins)
```

Perceptually Important Points (PIP)

```ruby
Khiva::Dimensionality.pip(a, number_ips)
```

Piecewise Linear Approximation (PLA Bottom Up)

```ruby
Khiva::Dimensionality.pla_bottom_up(a, max_error)
```

Piecewise Linear Approximation (PLA Sliding Window)

```ruby
Khiva::Dimensionality.pla_sliding_window(a, max_error)
```

Ramer-Douglas-Peucker (RDP)

```ruby
Khiva::Dimensionality.ramer_douglas_peucker(a, epsilon)
```

Symbolic Aggregate ApproXimation (SAX)

```ruby
Khiva::Dimensionality.sax(a, alphabet_size)
```

Visvalingam

```ruby
Khiva::Dimensionality.visvalingam(a, num_points)
```

## Distances

Dynamic time warping (DTW) distance

```ruby
Khiva::Distances.dtw(tss)
```

Euclidean distance

```ruby
Khiva::Distances.euclidean(tss)
```

Hamming distance

```ruby
Khiva::Distances.hamming(tss)
```

Manhattan distance

```ruby
Khiva::Distances.manhattan(tss)
```

Shape-based distance (SBD)

```ruby
Khiva::Distances.sbd(tss)
```

Squared Euclidean distance

```ruby
Khiva::Distances.squared_euclidean(tss)
```

## Features

Sum of square values

```ruby
Khiva::Features.abs_energy(tss)
```

Absolute sum of changes

```ruby
Khiva::Features.absolute_sum_of_changes(tss)
```

Auto-covariance

```ruby
Khiva::Features.auto_covariance(tss, unbiased: false)
```

Binned entropy

```ruby
Khiva::Features.binned_entropy(tss, max_bins)
```

Schreiber, T. and Schmitz, A. (1997) measure of non-linearity

```ruby
Khiva::Features.c3(tss, lag)
```

Estimate of complexity defined by Batista, Gustavo EAPA, et al (2014)

```ruby
Khiva::Features.cid_ce(tss, z_normalize)
```

Number of values above the mean

```ruby
Khiva::Features.count_above_mean(tss)
```

Number of values below the mean

```ruby
Khiva::Features.count_below_mean(tss)
```

The spectral centroid (mean), variance, skew, and kurtosis of the absolute fourier transform spectrum

```ruby
Khiva::Features.fft_aggregated(tss)
```

First location of the maximum value

```ruby
Khiva::Features.first_location_of_maximum(tss)
```

First location of the minimum value

```ruby
Khiva::Features.first_location_of_minimum(tss)
```

Maximum is duplicated

```ruby
Khiva::Features.has_duplicate_max(tss)
```

Minimum is duplicated

```ruby
Khiva::Features.has_duplicate_min(tss)
```

Any elements are duplicated

```ruby
Khiva::Features.has_duplicates(tss)
```

Index of the mass quantile

```ruby
Khiva::Features.index_mass_quantile(tss, q)
```

Kurtosis

```ruby
Khiva::Features.kurtosis(tss)
```

Standard deviation above threshold

```ruby
Khiva::Features.large_standard_deviation(tss, r)
```

Last location of the maximum value

```ruby
Khiva::Features.last_location_of_maximum(tss)
```

Last location of the minimum value

```ruby
Khiva::Features.last_location_of_minimum(tss)
```

Length of the series

```ruby
Khiva::Features.length(tss)
```

Local maximals

```ruby
Khiva::Features.local_maximals(tss)
```

Length of the longest consecutive subsequence above the mean

```ruby
Khiva::Features.longest_strike_above_mean(tss)
```

Length of the longest consecutive subsequence below the mean

```ruby
Khiva::Features.longest_strike_below_mean(tss)
```

Maximum

```ruby
Khiva::Features.maximum(tss)
```

Mean

```ruby
Khiva::Features.mean(tss)
```

Mean absolute change

```ruby
Khiva::Features.mean_absolute_change(tss)
```

Mean change

```ruby
Khiva::Features.mean_change(tss)
```

Mean of a central approximation of the second derivative

```ruby
Khiva::Features.mean_second_derivative_central(tss)
```

Median

```ruby
Khiva::Features.median(tss)
```

Minimum

```ruby
Khiva::Features.minimum(tss)
```

Quantile

```ruby
Khiva::Features.quantile(tss, q, precision: 100000000)
```

Count of values within the interval [min, max]

```ruby
Khiva::Features.range_count(tss, min, max)
```

Ratio of values more than `r` sigma away from the mean

```ruby
Khiva::Features.ratio_beyond_r_sigma(tss, coeff)
```

Ratio of unique values

```ruby
Khiva::Features.ratio_value_number_to_time_series_length(tss)
```

Sample entropy

```ruby
Khiva::Features.sample_entropy(tss)
```

Skewness

```ruby
Khiva::Features.skewness(tss)
```

Cross power spectral density at different frequencies

```ruby
Khiva::Features.spkt_welch_density(tss, coeff)
```

Standard deviation

```ruby
Khiva::Features.standard_deviation(tss)
```

Sum of all data points present more than once

```ruby
Khiva::Features.sum_of_reoccurring_datapoints(tss, sorted: false)
```

Sum of all values present more than once

```ruby
Khiva::Features.sum_of_reoccurring_values(tss, sorted: false)
```

Sum of values

```ruby
Khiva::Features.sum_values(tss)
```

If looks symmetric

```ruby
Khiva::Features.symmetry_looking(tss, r)
```

Time reversal asymmetry

```ruby
Khiva::Features.time_reversal_asymmetry_statistic(tss, lag)
```

Number of occurrences of a value

```ruby
Khiva::Features.value_count(tss, v)
```

Variance

```ruby
Khiva::Features.variance(tss)
```

If variance is larger than one

```ruby
Khiva::Features.variance_larger_than_standard_deviation(tss)
```

## Library

Get backend info

```ruby
Khiva::Library.backend_info
```

Get current backend

```ruby
Khiva::Library.backend
```

Get available backends

```ruby
Khiva::Library.backends
```

Set backend - `:default`, `:cpu`, `:cuda`, `:opencl`

```ruby
Khiva::Library.set_backend(:cpu)
```

Set device

```ruby
Khiva::Library.set_device(device_id)
```

Get device id

```ruby
Khiva::Library.device_id
```

Get device count

```ruby
Khiva::Library.device_count
```

Set device memory in GB

```ruby
Khiva::Library.set_device_memory_in_gb(1.5)
```

Get version

```ruby
Khiva::Library.version
```

## Linalg

```ruby
Khiva::Linalg.lls(a, b)
```

## Matrix

Calculate the matrix profile between `ta` and `tb` using a subsequence length of `m` with the STOMP algorithm

```ruby
profile, index = Khiva::Matrix.stomp(ta, tb, m)
```

Calculate the matrix profile between `t` and itself using a subsequence length of `m` with the STOMP algorithm

```ruby
profile, index = Khiva::Matrix.stomp_self_join(t, m)
```

Calculate the matrix profile between `ta` and `tb` using a subsequence length of `m`

```ruby
profile, index = Khiva::Matrix.matrix_profile(ta, tb, m)
```

Calculate the matrix profile between `t` and itself using a subsequence length of `m`

```ruby
profile, index = Khiva::Matrix.matrix_profile_self_join(t, m)
```

## Normalization

Decimal scaling

```ruby
Khiva::Normalization.decimal_scaling_norm(tss)
Khiva::Normalization.decimal_scaling_norm!(tss)
```

Max min

```ruby
Khiva::Normalization.max_min_norm(tss)
Khiva::Normalization.max_min_norm!(tss)
```

Mean

```ruby
Khiva::Normalization.mean_norm(tss)
Khiva::Normalization.mean_norm!(tss)
```

Znorm

```ruby
Khiva::Normalization.znorm(tss)
Khiva::Normalization.znorm!(tss)
```

## Polynomial

Least squares polynomial fit

```ruby
Khiva::Polynomial.polyfit(x, y, deg)
```

## Regression

Linear least squares regression

```ruby
slope, intercept, rvalue, pvalue, stderrest = Khiva::Regression.linear(xss, yss)
```

## Regularization

```ruby
Khiva::Regularization.group_by(tss, aggregation_function, columns_key: 1, n_columns_value: 1)
```

## Statistics

Covariance

```ruby
Khiva::Statistics.covariance(tss, unbiased: false)
```

Kurtosis

```ruby
Khiva::Statistics.kurtosis(tss)
```

Ljung-Box

```ruby
Khiva::Statistics.ljung_box(tss, lags)
```

Moment

```ruby
Khiva::Statistics.moment(tss, k)
```

Quantile

```ruby
Khiva::Statistics.quantile(tss, q, precision: 1e-8)
```

Quantiles cut

```ruby
Khiva::Statistics.quantiles_cut(tss, quantiles, precision: 1e-8)
```

Standard deviation

```ruby
Khiva::Statistics.sample_stdev(tss)
```

Skewness

```ruby
Khiva::Statistics.skewness(tss)
```

## Khiva Installation

### Linux

Install Boost and Eigen. On Ubuntu, use:

```sh
sudo apt-get install libboost-all-dev libeigen3-dev
```

Install ArrayFire:

```sh
wget -q https://arrayfire.s3.amazonaws.com/3.7.3/ArrayFire-v3.7.3_Linux_x86_64.sh
chmod +x ./ArrayFire-v3.7.3_Linux_x86_64.sh
./ArrayFire-v3.7.3_Linux_x86_64.sh --include-subdir --prefix=/opt
echo /opt/arrayfire/lib64 | sudo tee /etc/ld.so.conf.d/arrayfire.conf
sudo ldconfig
```

And install Khiva:

```sh
git clone --recursive --branch v0.5.0 https://github.com/shapelets/khiva
cd khiva
mkdir build
cd build
cmake .. -DKHIVA_USE_CONAN=OFF -DKHIVA_BUILD_TESTS=OFF -DKHIVA_BUILD_BENCHMARKS=OFF -DKHIVA_BUILD_JNI_BINDINGS=OFF
make -j4
sudo make install
```

### Mac

Run:

```sh
brew install khiva
```

### Windows

See [instructions](https://khiva.readthedocs.io/en/latest/gettingStarted.html#windows).

## Credits

This library is modeled after the [Khiva-Python API](https://github.com/shapelets/khiva-python).

## History

View the [changelog](https://github.com/ankane/khiva-ruby/blob/master/CHANGELOG.md)

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ankane/khiva-ruby/issues)
- Fix bugs and [submit pull requests](https://github.com/ankane/khiva-ruby/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

To get started with development:

```sh
git clone https://github.com/ankane/khiva-ruby.git
cd khiva-ruby
bundle install
bundle exec rake test
```
