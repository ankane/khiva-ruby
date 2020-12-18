module Khiva
  module Statistics
    class << self
      def covariance(tss, unbiased: false)
        result = Utils.create_ptr
        FFI.call(:covariance_statistics, tss, Utils.bool_ptr(unbiased), result)
        Array.new(result)
      end

      def kurtosis(tss)
        result = Utils.create_ptr
        FFI.call(:kurtosis_statistics, tss, result)
        Array.new(result)
      end

      def ljung_box(tss, lags)
        result = Utils.create_ptr
        FFI.call(:ljung_box, tss, Utils.long_ptr(lags), result)
        Array.new(result)
      end

      def moment(tss, k)
        result = Utils.create_ptr
        FFI.call(:moment_statistics, tss, Utils.int_ptr(k), result)
        Array.new(result)
      end

      def quantile(tss, q, precision: 1e-8)
        result = Utils.create_ptr
        FFI.call(:quantile_statistics, tss, q, Utils.float_ptr(precision), result)
        Array.new(result)
      end

      def quantiles_cut(tss, quantiles, precision: 1e-8)
        result = Utils.create_ptr
        FFI.call(:quantiles_cut_statistics, tss, Utils.float_ptr(quantiles), Utils.float_ptr(precision), result)
        Array.new(result)
      end

      def sample_stdev(tss)
        result = Utils.create_ptr
        FFI.call(:sample_stdev_statistics, tss, result)
        Array.new(result)
      end

      def skewness(tss)
        result = Utils.create_ptr
        FFI.call(:skewness_statistics, tss, result)
        Array.new(result)
      end
    end
  end
end
