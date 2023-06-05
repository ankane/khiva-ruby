# stdlib
require "fiddle/import"

# modules
require_relative "khiva/array"
require_relative "khiva/clustering"
require_relative "khiva/dimensionality"
require_relative "khiva/distances"
require_relative "khiva/features"
require_relative "khiva/library"
require_relative "khiva/linalg"
require_relative "khiva/matrix"
require_relative "khiva/normalization"
require_relative "khiva/polynomial"
require_relative "khiva/regression"
require_relative "khiva/regularization"
require_relative "khiva/statistics"
require_relative "khiva/utils"
require_relative "khiva/version"

module Khiva
  class Error < StandardError; end

  class << self
    attr_accessor :ffi_lib
  end
  self.ffi_lib =
    if Gem.win_platform?
      ["khiva_c.dll"]
    elsif RbConfig::CONFIG["host_os"] =~ /darwin/i
      ["libkhiva_c.dylib"]
    else
      ["libkhiva_c.so"]
    end

  # friendlier error message
  autoload :FFI, "khiva/ffi"

  def self.lib_version
    Library.version
  end
end
