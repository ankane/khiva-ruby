require "bundler/setup"
Bundler.require(:default)
require "minitest/autorun"
require "minitest/pride"

class Minitest::Test
  def assert_elements_in_delta(expected, actual)
    actual = actual.to_a
    assert_equal expected.size, actual.size
    expected.zip(actual) do |exp, act|
      if exp.is_a?(Array)
        assert_elements_in_delta exp, act
      else
        assert_in_delta exp, act
      end
    end
  end
end

Khiva::Library.set_backend(:cpu)
Khiva::Library.set_device(0)
