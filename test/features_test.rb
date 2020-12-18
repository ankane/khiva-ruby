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

  def test_ratio_value_number_to_time_series_length
    expected = [1]
    assert_elements_in_delta expected, Khiva::Features.ratio_value_number_to_time_series_length(tss)
  end

  def test_sample_entropy
    expected = [Float::INFINITY]
    assert_elements_in_delta expected, Khiva::Features.sample_entropy(tss)
  end

  def test_skewness
    expected = [0]
    assert_elements_in_delta expected, Khiva::Features.skewness(tss)
  end

  def test_standard_deviation
    expected = [1.4142135623730951]
    assert_elements_in_delta expected, Khiva::Features.standard_deviation(tss)
  end

  def test_sum_values
    expected = [15]
    assert_elements_in_delta expected, Khiva::Features.sum_values(tss)
  end

  def test_value_count
    expected = [1]
    assert_elements_in_delta expected, Khiva::Features.value_count(tss, 3)
  end

  def test_variance
    expected = [2.5]
    assert_elements_in_delta expected, Khiva::Features.variance(tss)
  end

  def test_variance_larger_than_standard_deviation
    expected = [true]
    assert_equal expected, Khiva::Features.variance_larger_than_standard_deviation(tss).to_a
  end

  def tss
    Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
  end
end
