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

  def test_auto_covariance
    expected = [2.0, 0.8, -0.2, -0.8, -0.8]
    assert_elements_in_delta expected, Khiva::Features.auto_covariance(tss)
  end

  def test_binned_entropy
    expected = [1.0549201965332031]
    assert_elements_in_delta expected, Khiva::Features.binned_entropy(tss, 3)
  end

  def test_c3
    expected = [21.0]
    assert_elements_in_delta expected, Khiva::Features.c3(tss, 3)
  end

  def test_cid_ce
    expected = [1.414213562373095]
    assert_elements_in_delta expected, Khiva::Features.cid_ce(tss, true)
  end

  def test_count_above_mean
    expected = [2]
    assert_elements_in_delta expected, Khiva::Features.count_above_mean(tss)
  end

  def test_count_below_mean
    expected = [2]
    assert_elements_in_delta expected, Khiva::Features.count_below_mean(tss)
  end

  def test_fft_aggregated
    expected = [0.434631407211718, 0.485985279952239, Float::NAN, Float::NAN]
    assert_elements_in_delta expected, Khiva::Features.fft_aggregated(tss)
  end

  def test_first_location_of_maximum
    expected = [0.8]
    assert_elements_in_delta expected, Khiva::Features.first_location_of_maximum(tss)
  end

  def test_first_location_of_minimum
    expected = [0]
    assert_elements_in_delta expected, Khiva::Features.first_location_of_minimum(tss)
  end

  def test_has_duplicate_max
    expected = [false]
    assert_equal expected, Khiva::Features.has_duplicate_max(tss).to_a
  end

  def test_has_duplicate_min
    expected = [false]
    assert_equal expected, Khiva::Features.has_duplicate_min(tss).to_a
  end

  def test_has_duplicates
    expected = [false]
    assert_equal expected, Khiva::Features.has_duplicates(tss).to_a
  end

  def test_index_mass_quantile
    expected = [0.8]
    assert_elements_in_delta expected, Khiva::Features.index_mass_quantile(tss, 0.5)
  end

  def test_kurtosis
    expected = [-1.2]
    assert_elements_in_delta expected, Khiva::Features.kurtosis(tss)
  end

  def test_large_standard_deviation
    expected = [false]
    assert_equal expected, Khiva::Features.large_standard_deviation(tss, 1).to_a
  end

  def test_last_location_of_maximum
    expected = [1]
    assert_elements_in_delta expected, Khiva::Features.last_location_of_maximum(tss)
  end

  def test_last_location_of_minimum
    expected = [0.2]
    assert_elements_in_delta expected, Khiva::Features.last_location_of_minimum(tss)
  end

  def test_length
    expected = [5]
    assert_elements_in_delta expected, Khiva::Features.length(tss)
  end

  # TODO
  def test_linear_trend
  end

  def test_local_maximals
    expected = [1.0, 0.0, 0.0, 0.0, 1.0]
    assert_elements_in_delta expected, Khiva::Features.local_maximals(tss)
  end

  def test_longest_strike_above_mean
    expected = [2]
    assert_elements_in_delta expected, Khiva::Features.longest_strike_above_mean(tss)
  end

  def test_longest_strike_below_mean
    expected = [2]
    assert_elements_in_delta expected, Khiva::Features.longest_strike_below_mean(tss)
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

  def test_sum_of_reoccurring_datapoints
    expected = [0]
    assert_elements_in_delta expected, Khiva::Features.sum_of_reoccurring_datapoints(tss)
  end

  def test_sum_of_reoccurring_values
    expected = [0]
    assert_elements_in_delta expected, Khiva::Features.sum_of_reoccurring_values(tss)
  end

  def test_sum_values
    expected = [15]
    assert_elements_in_delta expected, Khiva::Features.sum_values(tss)
  end

  def test_symmetry_looking
    expected = [true]
    assert_equal expected, Khiva::Features.symmetry_looking(tss, 0.5).to_a
  end

  def test_time_reversal_asymmetry_statistic
    expected = [72]
    assert_elements_in_delta expected, Khiva::Features.time_reversal_asymmetry_statistic(tss, 2)
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
