require_relative "test_helper"

class LibraryTest < Minitest::Test
  def test_backend_info
    assert_match "ArrayFire", Khiva::Library.backend_info
  end

  def test_backend
    assert_equal :cpu, Khiva::Library.backend
  end

  def test_backends
    expected = mac? ? [:cpu, :opencl] : [:cpu]
    assert_equal expected, Khiva::Library.backends
  end

  def test_device_id
    assert_equal 0, Khiva::Library.device_id
  end

  def test_device_count
    assert_equal 1, Khiva::Library.device_count
  end

  def test_set_device_memory_in_gb
    Khiva::Library.set_device_memory_in_gb(0.5)
  end

  def test_version
    assert_equal "0.5.0", Khiva::Library.version
    assert_equal "0.5.0", Khiva.lib_version # legacy
  end
end
