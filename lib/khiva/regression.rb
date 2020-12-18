module Khiva
  module Regression
    class << self
      def linear(xss, yss)
        slope = Utils.create_ptr
        intercept = Utils.create_ptr
        rvalue = Utils.create_ptr
        pvalue = Utils.create_ptr
        stderrest = Utils.create_ptr
        FFI.call(:linear, xss, yss, slope, intercept, rvalue, pvalue, stderrest)
        [Array.new(slope), Array.new(intercept), Array.new(rvalue), Array.new(pvalue), Array.new(stderrest)]
      end
    end
  end
end
