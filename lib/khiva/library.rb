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

      def set_backend(backend)
        b = BACKENDS[backend]
        raise Error, "Invalid backend: #{backend}" unless b
        FFI.call(:set_backend, Utils.int_ptr(b))
      end

      def set_device(device)
        FFI.call(:set_device, Utils.int_ptr(device))
      end

      def version
        v = Fiddle::Pointer.malloc(20)
        FFI.call(:version, v.ref)
        v.to_s
      end
    end
  end
end
