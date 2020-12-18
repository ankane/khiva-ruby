module Khiva
  module Features
    class << self
      def abs_energy(arr)
        result = Utils.create_ptr
        FFI.call(:abs_energy, arr, result)
        Array.new(result)
      end

      def absolute_sum_of_changes(arr)
        result = Utils.create_ptr
        FFI.call(:absolute_sum_of_changes, arr, result)
        Array.new(result)
      end

      def auto_covariance(arr, unbiased: false)
        result = Utils.create_ptr
        FFI.call(:auto_covariance, arr, Utils.bool_ptr(unbiased), result)
        Array.new(result)
      end

      def binned_entropy(arr, max_bins)
        result = Utils.create_ptr
        FFI.call(:binned_entropy, arr, Utils.int_ptr(max_bins), result)
        Array.new(result)
      end

      def c3(arr, lag)
        result = Utils.create_ptr
        FFI.call(:c3, arr, Utils.long_ptr(lag), result)
        Array.new(result)
      end

      def cid_ce(arr, z_normalize)
        result = Utils.create_ptr
        FFI.call(:cid_ce, arr, Utils.bool_ptr(z_normalize), result)
        Array.new(result)
      end

      def count_above_mean(arr)
        result = Utils.create_ptr
        FFI.call(:count_above_mean, arr, result)
        Array.new(result)
      end

      def count_below_mean(arr)
        result = Utils.create_ptr
        FFI.call(:count_below_mean, arr, result)
        Array.new(result)
      end

      def fft_aggregated(arr)
        result = Utils.create_ptr
        FFI.call(:fft_aggregated, arr, result)
        Array.new(result)
      end

      def first_location_of_maximum(arr)
        result = Utils.create_ptr
        FFI.call(:first_location_of_maximum, arr, result)
        Array.new(result)
      end

      def first_location_of_minimum(arr)
        result = Utils.create_ptr
        FFI.call(:first_location_of_minimum, arr, result)
        Array.new(result)
      end

      def has_duplicate_max(arr)
        result = Utils.create_ptr
        FFI.call(:has_duplicate_max, arr, result)
        Array.new(result)
      end

      def has_duplicate_min(arr)
        result = Utils.create_ptr
        FFI.call(:has_duplicate_min, arr, result)
        Array.new(result)
      end

      def has_duplicates(arr)
        result = Utils.create_ptr
        FFI.call(:has_duplicates, arr, result)
        Array.new(result)
      end

      def index_mass_quantile(arr, q)
        result = Utils.create_ptr
        FFI.call(:index_mass_quantile, arr, Utils.float_ptr(q), result)
        Array.new(result)
      end

      def kurtosis(arr)
        result = Utils.create_ptr
        FFI.call(:kurtosis, arr, result)
        Array.new(result)
      end

      def large_standard_deviation(arr, r)
        result = Utils.create_ptr
        FFI.call(:large_standard_deviation, arr, Utils.float_ptr(r), result)
        Array.new(result)
      end

      def last_location_of_maximum(arr)
        result = Utils.create_ptr
        FFI.call(:last_location_of_maximum, arr, result)
        Array.new(result)
      end

      def last_location_of_minimum(arr)
        result = Utils.create_ptr
        FFI.call(:last_location_of_minimum, arr, result)
        Array.new(result)
      end

      def length(arr)
        result = Utils.create_ptr
        FFI.call(:length, arr, result)
        Array.new(result)
      end

      def local_maximals(arr)
        result = Utils.create_ptr
        FFI.call(:local_maximals, arr, result)
        Array.new(result)
      end

      def longest_strike_above_mean(arr)
        result = Utils.create_ptr
        FFI.call(:longest_strike_above_mean, arr, result)
        Array.new(result)
      end

      def longest_strike_below_mean(arr)
        result = Utils.create_ptr
        FFI.call(:longest_strike_below_mean, arr, result)
        Array.new(result)
      end

      def maximum(arr)
        result = Utils.create_ptr
        FFI.call(:maximum, arr, result)
        Array.new(result)
      end

      def mean(arr)
        result = Utils.create_ptr
        FFI.call(:mean, arr, result)
        Array.new(result)
      end

      def mean_absolute_change(arr)
        result = Utils.create_ptr
        FFI.call(:mean_absolute_change, arr, result)
        Array.new(result)
      end

      def mean_change(arr)
        result = Utils.create_ptr
        FFI.call(:mean_change, arr, result)
        Array.new(result)
      end

      def mean_second_derivative_central(arr)
        result = Utils.create_ptr
        FFI.call(:mean_second_derivative_central, arr, result)
        Array.new(result)
      end

      def median(arr)
        result = Utils.create_ptr
        FFI.call(:median, arr, result)
        Array.new(result)
      end

      def minimum(arr)
        result = Utils.create_ptr
        FFI.call(:minimum, arr, result)
        Array.new(result)
      end

      def ratio_value_number_to_time_series_length(arr)
        result = Utils.create_ptr
        FFI.call(:ratio_value_number_to_time_series_length, arr, result)
        Array.new(result)
      end

      def sample_entropy(arr)
        result = Utils.create_ptr
        FFI.call(:sample_entropy, arr, result)
        Array.new(result)
      end

      def skewness(arr)
        result = Utils.create_ptr
        FFI.call(:skewness, arr, result)
        Array.new(result)
      end

      def standard_deviation(arr)
        result = Utils.create_ptr
        FFI.call(:standard_deviation, arr, result)
        Array.new(result)
      end

      def sum_values(arr)
        result = Utils.create_ptr
        FFI.call(:sum_values, arr, result)
        Array.new(result)
      end

      def value_count(arr, v)
        result = Utils.create_ptr
        FFI.call(:value_count, arr, Utils.float_ptr(v), result)
        Array.new(result)
      end

      def variance(arr)
        result = Utils.create_ptr
        FFI.call(:variance, arr, result)
        Array.new(result)
      end

      def variance_larger_than_standard_deviation(arr)
        result = Utils.create_ptr
        FFI.call(:variance_larger_than_standard_deviation, arr, result)
        Array.new(result)
      end
    end
  end
end
