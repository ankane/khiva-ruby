module Khiva
  module Linalg
    class << self
      def lls(a, b)
        result = Utils.create_ptr
        FFI.call(:lls, a, b, result)
        Array.new(result)
      end
    end
  end
end
