module Khiva
  module Features
    class << self
      def abs_energy(arr)
        result = Utils.create_ptr
        FFI.call(:abs_energy, arr, result)
        Array.new(result)
      end
    end
  end
end
