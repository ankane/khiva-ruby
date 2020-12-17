# Khiva

[Khiva](https://github.com/shapelets/khiva) - high-performance time series algorithms - for Ruby

[![Build Status](https://github.com/ankane/khiva-ruby/workflows/build/badge.svg?branch=master)](https://github.com/ankane/khiva-ruby/actions)

## Installation

First, [install Khiva](#khiva-installation). For Homebrew use:

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
discords, discords_indices, subsequence_indices = Khiva::Matrix.find_best_n_discords(profile, index, 2, 2)
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

## Normalization

Decimal scaling

```ruby
Khiva::Distances.decimal_scaling_norm(tss)
Khiva::Distances.decimal_scaling_norm!(tss)
```

Max min

```ruby
Khiva::Distances.max_min_norm(tss)
Khiva::Distances.max_min_norm!(tss)
```

Mean

```ruby
Khiva::Distances.mean_norm(tss)
Khiva::Distances.mean_norm!(tss)
```

Znorm

```ruby
Khiva::Distances.znorm(tss)
Khiva::Distances.znorm!(tss)
```

## Statistics

Covariance

```ruby
Khiva::Statistics.covariance(tss, unbiased: false)
```

## Khiva Installation

### Linux

Run:

```sh
# todo
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
