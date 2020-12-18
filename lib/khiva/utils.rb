module Khiva
  module Utils
    class << self
      def create_ptr
        Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
      end

      def int_ptr(v)
        Fiddle::Pointer[[v].pack("i")]
      end

      def long_ptr(v)
        Fiddle::Pointer[[v].pack("L!")]
      end

      def float_ptr(v)
        Fiddle::Pointer[[v].pack("f")]
      end

      def double_ptr(v)
        Fiddle::Pointer[[v].pack("d")]
      end

      def bool_ptr(v)
        Fiddle::Pointer[[v ? 1 : 0].pack("c")]
      end

      # TODO make more efficient
      def reshape(arr, dims)
        arr = arr.flatten
        dims[1..-1].reverse.each do |dim|
          arr = arr.each_slice(dim)
        end
        arr.to_a
      end
    end
  end
end
