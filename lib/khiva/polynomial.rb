module Khiva
  module Polynomial
    class << self
      def polyfit(x, y, deg)
        result = Utils.create_ptr
        FFI.call(:polyfit, x, y, Utils.int_ptr(deg), result)
        Array.new(result)
      end
    end
  end
end
