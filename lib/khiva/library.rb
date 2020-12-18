module Khiva
  module Library
    BACKENDS = {
      default: 0,
      cpu: 1,
      cuda: 2,
      opencl: 4
    }

    class << self
      def backend_info
        info = Fiddle::Pointer.malloc(1000)
        FFI.call(:backend_info, info.ref)
        info.to_s
      end

      def backend
        backend = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
        FFI.call(:get_backend, backend)
        BACKENDS.map(&:reverse).to_h[backend.to_s(backend.size).unpack1("i")]
      end

      def backends
        backends = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
        FFI.call(:get_backends, backends)
        mask = backends.to_s(backends.size).unpack1("i")
        BACKENDS.select { |_, v| mask & v != 0 }.map(&:first)
      end

      def set_backend(backend)
        b = BACKENDS[backend]
        raise Error, "Invalid backend: #{backend}" unless b
        FFI.call(:set_backend, Utils.int_ptr(b))
      end

      def set_device(device)
        FFI.call(:set_device, Utils.int_ptr(device))
      end

      def device_id
        device_id = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
        FFI.call(:get_device_id, device_id)
        device_id.to_s(device_id.size).unpack1("i")
      end

      def device_count
        device_count = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
        FFI.call(:get_device_count, device_count)
        device_count.to_s(device_count.size).unpack1("i")
      end

      def set_device_memory_in_gb(memory)
        FFI.call(:set_device_memory_in_gb, Utils.double_ptr(memory))
      end

      def version
        v = Fiddle::Pointer.malloc(20)
        FFI.call(:version, v.ref)
        v.to_s
      end
    end
  end
end
