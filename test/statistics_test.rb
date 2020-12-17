require_relative "test_helper"

class StatisticsTest < Minitest::Test
  def test_covariance
    tss = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    expected = [2]
    assert_elements_in_delta expected, Khiva::Statistics.covariance(tss).to_a
  end
end
