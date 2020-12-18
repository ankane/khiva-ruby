require_relative "test_helper"

class FeaturesTest < Minitest::Test
  def test_abs_energy
    tss = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    expected = [55]
    assert_elements_in_delta expected, Khiva::Features.abs_energy(tss)
  end
end
