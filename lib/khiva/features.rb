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
