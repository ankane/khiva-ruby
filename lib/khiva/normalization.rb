module Khiva
  module Normalization
    class << self
      def decimal_scaling_norm(tss)
        result = Utils.create_ptr
        FFI.call(:decimal_scaling_norm, tss, result)
        Array.new(result)
      end

      def decimal_scaling_norm!(tss)
        FFI.call(:decimal_scaling_norm_in_place, tss)
        tss
      end

      def max_min_norm(tss, high: 1, low: 0, epsilon: 0.00000001)
        result = Utils.create_ptr
        FFI.call(:max_min_norm, tss, Utils.double_ptr(high), Utils.double_ptr(low), Utils.double_ptr(epsilon), result)
        Array.new(result)
      end

      def max_min_norm!(tss, high: 1, low: 0, epsilon: 0.00000001)
        FFI.call(:max_min_norm_in_place, tss, Utils.double_ptr(high), Utils.double_ptr(low), Utils.double_ptr(epsilon))
        tss
      end

      def mean_norm(tss)
        result = Utils.create_ptr
        FFI.call(:mean_norm, tss, result)
        Array.new(result)
      end

      def mean_norm!(tss)
        FFI.call(:mean_norm_in_place, tss)
        tss
      end

      def znorm(tss, epsilon: 0.00000001)
        result = Utils.create_ptr
        FFI.call(:znorm, tss, Utils.double_ptr(epsilon), result)
        Array.new(result)
      end

      def znorm!(tss, epsilon: 0.00000001)
        FFI.call(:znorm_in_place, tss, Utils.double_ptr(epsilon))
        tss
      end
    end
  end
end
