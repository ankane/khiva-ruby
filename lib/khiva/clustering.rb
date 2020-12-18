module Khiva
  module Clustering
    class << self
      def k_means(tss, k, tolerance: 1e-10, max_iterations: 100)
        centroids = Utils.create_ptr
        labels = Utils.create_ptr
        FFI.call(:k_means, tss, Utils.int_ptr(k), centroids, labels, Utils.float_ptr(tolerance), Utils.int_ptr(max_iterations))
        [Array.new(centroids), Array.new(labels)]
      end
    end
  end
end
