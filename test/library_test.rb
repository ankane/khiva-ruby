require_relative "test_helper"

class LibraryTest < Minitest::Test
  def test_version
    assert_equal "0.5.0", Khiva::Library.version
    assert_equal "0.5.0", Khiva.lib_version # legacy
  end

  def test_backend_info
    assert_match "ArrayFire", Khiva::Library.backend_info
  end
end
