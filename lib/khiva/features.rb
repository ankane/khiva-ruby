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
    end
  end
end
