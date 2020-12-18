module Khiva
  module Regularization
    class << self
      def group_by(tss, aggregation_function, n_columns_key: 1, n_columns_value: 1)
        result = Utils.create_ptr
        FFI.call(:group_by, tss, Utils.int_ptr(aggregation_function), Utils.int_ptr(n_columns_key), Utils.int_ptr(n_columns_value), result)
        Array.new(result)
      end
    end
  end
end
