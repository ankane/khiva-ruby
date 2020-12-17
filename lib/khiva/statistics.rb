module Khiva
  module Statistics
    class << self
      def covariance(tss, unbiased: false)
        result = Utils.create_ptr
        FFI.call(:covariance_statistics, tss, Utils.bool_ptr(unbiased), result)
        Array.new(result)
      end
    end
  end
end
