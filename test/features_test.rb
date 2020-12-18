require_relative "test_helper"

class FeaturesTest < Minitest::Test
  def test_abs_energy
    expected = [55]
    assert_elements_in_delta expected, Khiva::Features.abs_energy(tss)
  end

  def test_absolute_sum_of_changes
    expected = [4]
    assert_elements_in_delta expected, Khiva::Features.absolute_sum_of_changes(tss)
  end

  def test_maximum
    expected = [5]
    assert_elements_in_delta expected, Khiva::Features.maximum(tss)
  end

  def test_mean
    expected = [3]
    assert_elements_in_delta expected, Khiva::Features.mean(tss)
  end

  def test_mean_absolute_change
    expected = [0.8]
    assert_elements_in_delta expected, Khiva::Features.mean_absolute_change(tss)
  end

  def test_mean_change
    expected = [0.8]
    assert_elements_in_delta expected, Khiva::Features.mean_change(tss)
  end

  def test_mean_second_derivative_central
    expected = [0]
    assert_elements_in_delta expected, Khiva::Features.mean_second_derivative_central(tss)
  end

  def test_median
    expected = [3]
    assert_elements_in_delta expected, Khiva::Features.median(tss)
  end

  def test_minimum
    expected = [1]
    assert_elements_in_delta expected, Khiva::Features.minimum(tss)
  end

  def tss
    Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
  end
end
