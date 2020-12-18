require_relative "test_helper"

class DimensionalityTest < Minitest::Test
  def test_paa
    tss = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    expected = [1.5, 4.0]
    assert_elements_in_delta expected, Khiva::Dimensionality.paa(tss, 2)
  end
end
