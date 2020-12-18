module Khiva
  module Dimensionality
    class << self
      def paa(a, bins)
        result = Utils.create_ptr
        FFI.call(:paa, a, Utils.int_ptr(bins), result)
        Array.new(result)
      end

      def pip(a, number_ips)
        result = Utils.create_ptr
        FFI.call(:pip, a, Utils.int_ptr(number_ips), result)
        Array.new(result)
      end

      def pla_bottom_up(a, max_error)
        result = Utils.create_ptr
        FFI.call(:pla_bottom_up, a, Utils.float_ptr(max_error), result)
        Array.new(result)
      end

      def pla_sliding_window(a, max_error)
        result = Utils.create_ptr
        FFI.call(:pla_sliding_window, a, Utils.float_ptr(max_error), result)
        Array.new(result)
      end

      def ramer_douglas_peucker(a, epsilon)
        result = Utils.create_ptr
        FFI.call(:ramer_douglas_peucker, a, Utils.double_ptr(epsilon), result)
        Array.new(result)
      end

      def sax(a, alphabet_size)
        result = Utils.create_ptr
        FFI.call(:sax, a, Utils.int_ptr(alphabet_size), result)
        Array.new(result)
      end

      def visvalingam(a, num_points)
        result = Utils.create_ptr
        FFI.call(:visvalingam, a, Utils.int_ptr(num_points), result)
        Array.new(result)
      end
    end
  end
end
