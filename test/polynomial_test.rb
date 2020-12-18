require_relative "test_helper"

class PolynomialTest < Minitest::Test
  def test_polyfit
    a = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    b = Khiva::Array.new([10, 20, 30, 40, 50], type: :f32)
    expected = [0, 10, 0]
    assert_elements_in_delta expected, Khiva::Polynomial.polyfit(a, b, 2)
  end

  # TODO requires complex
  def test_roots
  end
end
