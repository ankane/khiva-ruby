module Khiva
  class Array
    TYPES = [:f32, :c32, :f64, :c64, :b8, :s32, :u32, :u8, :s64, :u64, :s16, :u16]
    # TODO support complex
    TYPE_FORMAT = {
      f32: "f",
      c32: "",
      f64: "d",
      c64: "",
      b8: "c",
      s32: "l",
      u32: "L",
      u8: "C",
      s64: "q",
      u64: "Q",
      s16: "s",
      u16: "S"
    }

    def initialize(obj, type: nil)
      if obj.is_a?(Fiddle::Pointer)
        @ptr = obj
      else
        # TODO make more performant for Numo
        obj = obj.to_a
        dims = []
        o = obj
        4.times do
          break unless o.is_a?(::Array)
          dims << o.size
          o = o.first
        end
        dims.reverse!

        flat_obj = obj.flatten(dims.size)

        # TODO check each dimension
        expected_size = dims.inject(1, &:*)
        raise Error, "Unexpected size" if flat_obj.size != expected_size

        # TODO check integer range
        type ||= flat_obj.all? { |v| v.is_a?(Integer) } ? :s64 : :f64

        data = Fiddle::Pointer[flat_obj.pack("#{TYPE_FORMAT[type]}*")]
        ndims = dims.size
        dims = Fiddle::Pointer[dims.pack("q!*")]
        result = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)

        FFI.call(:create_array, data, ndims, dims, result, TYPES.index(type))
        @ptr = result
      end

      ObjectSpace.define_finalizer(self, self.class.finalize(@ptr))
    end

    def display
      FFI.call(:display, @ptr)
    end

    # TODO add bit operations
    [
      [:+, :khiva_add],
      [:-, :khiva_sub],
      [:*, :khiva_mul],
      [:/, :khiva_div],
      [:%, :khiva_mod],
      [:**, :khiva_pow],
      [:lt, :khiva_lt],
      [:gt, :khiva_gt],
      [:le, :khiva_le],
      [:ge, :khiva_ge],
      [:eq, :khiva_eq],
      [:ne, :khiva_ne]
    ].each do |ruby_method, ffi_method|
      define_method(ruby_method) do |other|
        result = Utils.create_ptr
        FFI.call(ffi_method, @ptr, other, result)
        self.class.new(result)
      end
    end

    def to_a
      d = dims
      d.pop while d.last == 1 && d.size > 1
      d.reverse!

      elements = dims.inject(1, &:*)
      data = Fiddle::Pointer.malloc(elements * element_size)
      FFI.call(:get_data, @ptr, data)
      result = data.to_s(data.size).unpack("#{TYPE_FORMAT[type]}*")
      result.map! { |r| r > 0 ? true : false } if type == :b8
      Utils.reshape(result, d)
    end

    def dims
      dims = Fiddle::Pointer.malloc(Fiddle::SIZEOF_LONG_LONG * 4)
      FFI.call(:get_dims, @ptr, dims)
      dims.to_s(dims.size).unpack("q!*")
    end

    def type
      type = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      FFI.call(:get_type, @ptr, type)
      TYPES[type.to_s(type.size).unpack1("i")]
    end

    def to_ptr
      @ptr
    end

    def element_size
      case type
      when :b8, :u8
        1
      when :s16, :u16
        2
      when :f32, :c32, :s32, :u32
        4
      when :f64, :c64, :s64, :u64
        8
      else
        raise Error, "Unknown type: #{type}"
      end
    end

    def copy
      result = Utils.create_ptr
      FFI.call(:copy, @ptr, result)
      self.class.new(result)
    end
    alias_method :dup, :copy
    alias_method :clone, :copy

    def self.finalize(ptr)
      # must use proc instead of stabby lambda
      proc { FFI.call(:delete_array, ptr) }
    end
  end
end
