# stdlib
require "fiddle/import"

# modules
require "khiva/array"
require "khiva/clustering"
require "khiva/dimensionality"
require "khiva/distances"
require "khiva/features"
require "khiva/library"
require "khiva/linalg"
require "khiva/matrix"
require "khiva/normalization"
require "khiva/polynomial"
require "khiva/regression"
require "khiva/regularization"
require "khiva/statistics"
require "khiva/utils"
require "khiva/version"

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
