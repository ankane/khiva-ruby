module Khiva
  module Dimensionality
    class << self
      def paa(a, bins)
        result = Utils.create_ptr
        FFI.call(:paa, a, Utils.int_ptr(bins), result)
        Array.new(result)
      end
    end
  end
end
