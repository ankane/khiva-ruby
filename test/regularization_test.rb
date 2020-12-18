require_relative "test_helper"

class RegularizationTest < Minitest::Test
  def test_group_by
    tss = Khiva::Array.new([[1, 2, 3], [4, 5, 6]])
    expected = [4, 5, 6]
    assert_elements_in_delta expected, Khiva::Regularization.group_by(tss, 0)
  end
end
