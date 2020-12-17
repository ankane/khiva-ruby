module Khiva
  module Distances
    class << self
      def dtw(tss)
        result = Utils.create_ptr
        FFI.call(:dtw, tss, result)
        Array.new(result)
      end

      def euclidean(tss)
        result = Utils.create_ptr
        FFI.call(:euclidean, tss, result)
        Array.new(result)
      end

      def hamming(tss)
        result = Utils.create_ptr
        FFI.call(:hamming, tss, result)
        Array.new(result)
      end

      def manhattan(tss)
        result = Utils.create_ptr
        FFI.call(:manhattan, tss, result)
        Array.new(result)
      end

      def sbd(tss)
        result = Utils.create_ptr
        FFI.call(:sbd, tss, result)
        Array.new(result)
      end

      def squared_euclidean(tss)
        result = Utils.create_ptr
        FFI.call(:squared_euclidean, tss, result)
        Array.new(result)
      end
    end
  end
end
