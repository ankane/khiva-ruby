require_relative "test_helper"

class RegressionTest < Minitest::Test
  def test_linear
    a = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    b = Khiva::Array.new([10, 20, 30, 40, 50], type: :f32)
    slope, intercept, rvalue, pvalue, stderrest = Khiva::Regression.linear(a, b)
    assert_elements_in_delta [10], slope
    assert_elements_in_delta [0], intercept
    assert_elements_in_delta [1], rvalue
    assert_elements_in_delta [0], pvalue
    assert_elements_in_delta [0], stderrest
  end
end
