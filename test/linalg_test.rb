require_relative "test_helper"

class LinalgTest < Minitest::Test
  def test_lls
    a = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    b = Khiva::Array.new([10, 20, 30, 40, 50], type: :f32)
    expected = [10]
    assert_elements_in_delta expected, Khiva::Linalg.lls(a, b)
  end
end
