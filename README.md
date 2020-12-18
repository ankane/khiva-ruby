# Khiva

[Khiva](https://github.com/shapelets/khiva) - high-performance time series algorithms - for Ruby

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
discord_distances, discord_indices, subsequence_indices = Khiva::Matrix.find_best_n_discords(profile, index, 2, 2)
```

Find motifs

```ruby
motif_distances, motif_indices, subsequence_indices = Khiva::Matrix.find_best_n_motifs(profile, index, 2, 2)
```

## Arrays

Create an array from a Ruby array

```ruby
Khiva::Array.new([1, 2, 3])
```

Specify the type

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
