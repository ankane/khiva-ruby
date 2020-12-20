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

      def aggregated_autocorrelation(arr, aggregation_function)
        result = Utils.create_ptr
        FFI.call(:aggregated_autocorrelation, arr, Utils.int_ptr(aggregation_function), result)
        Array.new(result)
      end

      # TODO aggregated_linear_trend

      def approximate_entropy(arr, m, r)
        result = Utils.create_ptr
        FFI.call(:approximate_entropy, arr, Utils.int_ptr(m), Utils.float_ptr(r), result)
        Array.new(result)
      end

      def auto_correlation(arr, max_lag, unbiased)
        result = Utils.create_ptr
        FFI.call(:auto_correlation, arr, Utils.long_ptr(max_lag), Utils.bool_ptr(unbiased), result)
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

      def cross_correlation(xss, yss, unbiased)
        result = Utils.create_ptr
        FFI.call(:cross_correlation, xss, yss, Utils.bool_ptr(unbiased), result)
        Array.new(result)
      end

      def cross_covariance(xss, yss, unbiased)
        result = Utils.create_ptr
        FFI.call(:cross_covariance, xss, yss, Utils.bool_ptr(unbiased), result)
        Array.new(result)
      end

      # TODO cwt_coefficients

      def energy_ratio_by_chunks(arr, num_segments, segment_focus)
        result = Utils.create_ptr
        FFI.call(:energy_ratio_by_chunks, arr, Utils.long_ptr(num_segments), Utils.long_ptr(segment_focus), result)
        Array.new(result)
      end

      def fft_aggregated(arr)
        result = Utils.create_ptr
        FFI.call(:fft_aggregated, arr, result)
        Array.new(result)
      end

      # TODO fft_coefficient

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

      def number_crossing_m(arr, m)
        result = Utils.create_ptr
        FFI.call(:number_crossing_m, arr, Utils.int_ptr(m), result)
        Array.new(result)
      end

      # TODO number_cwt_peaks

      def number_peaks(arr, n)
        result = Utils.create_ptr
        FFI.call(:number_peaks, arr, Utils.int_ptr(n), result)
        Array.new(result)
      end

      def partial_autocorrelation(arr, lags)
        result = Utils.create_ptr
        FFI.call(:partial_autocorrelation, arr, lags, result)
        Array.new(result)
      end

      def percentage_of_reoccurring_datapoints_to_all_datapoints(arr, sorted)
        result = Utils.create_ptr
        FFI.call(:percentage_of_reoccurring_datapoints_to_all_datapoints, arr, Utils.bool_ptr(sorted), result)
        Array.new(result)
      end

      def percentage_of_reoccurring_values_to_all_values(arr, sorted)
        result = Utils.create_ptr
        FFI.call(:percentage_of_reoccurring_values_to_all_values, arr, Utils.bool_ptr(sorted), result)
        Array.new(result)
      end

      def quantile(arr, q, precision: 100000000)
        result = Utils.create_ptr
        FFI.call(:quantile, arr, q, Utils.float_ptr(precision), result)
        Array.new(result)
      end

      def range_count(arr, min, max)
        result = Utils.create_ptr
        FFI.call(:range_count, arr, Utils.float_ptr(min), Utils.float_ptr(max), result)
        Array.new(result)
      end

      def ratio_beyond_r_sigma(arr, r)
        result = Utils.create_ptr
        FFI.call(:ratio_beyond_r_sigma, arr, Utils.float_ptr(r), result)
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

      def spkt_welch_density(arr, coeff)
        result = Utils.create_ptr
        FFI.call(:spkt_welch_density, arr, Utils.int_ptr(coeff), result)
        Array.new(result)
      end

      def standard_deviation(arr)
        result = Utils.create_ptr
        FFI.call(:standard_deviation, arr, result)
        Array.new(result)
      end

      def sum_of_reoccurring_datapoints(arr, sorted: false)
        result = Utils.create_ptr
        FFI.call(:sum_of_reoccurring_datapoints, arr, Utils.bool_ptr(sorted), result)
        Array.new(result)
      end

      def sum_of_reoccurring_values(arr, sorted: false)
        result = Utils.create_ptr
        FFI.call(:sum_of_reoccurring_values, arr, Utils.bool_ptr(sorted), result)
        Array.new(result)
      end

      def sum_values(arr)
        result = Utils.create_ptr
        FFI.call(:sum_values, arr, result)
        Array.new(result)
      end

      def symmetry_looking(arr, r)
        result = Utils.create_ptr
        FFI.call(:symmetry_looking, arr, Utils.float_ptr(r), result)
        Array.new(result)
      end

      def time_reversal_asymmetry_statistic(arr, lag)
        result = Utils.create_ptr
        FFI.call(:time_reversal_asymmetry_statistic, arr, Utils.int_ptr(lag), result)
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
