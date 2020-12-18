require_relative "test_helper"

class StatisticsTest < Minitest::Test
  def test_covariance
    expected = [2]
    assert_elements_in_delta expected, Khiva::Statistics.covariance(tss).to_a
  end

  def test_kurtosis
    expected = [-1.2]
    assert_elements_in_delta expected, Khiva::Statistics.kurtosis(tss).to_a
  end

  def test_ljung_box
    expected = [4.316667079925537]
    assert_elements_in_delta expected, Khiva::Statistics.ljung_box(tss, 3).to_a
  end

  def test_moment
    expected = [45]
    assert_elements_in_delta expected, Khiva::Statistics.moment(tss, 3).to_a
  end

  def test_quantile
    q = Khiva::Array.new([0.5])
    expected = [3]
    assert_elements_in_delta expected, Khiva::Statistics.quantile(tss, q).to_a
  end

  def test_quantiles_cut
    expected = [[0.9999999900000001, 0.9999999900000001, 2.333333373069763, 3.6666667461395264, 3.6666667461395264], [2.333333373069763, 2.333333373069763, 3.6666667461395264, 5.0, 5.0]]
    assert_elements_in_delta expected, Khiva::Statistics.quantiles_cut(tss, 3).to_a
  end

  def test_sample_stdev
    expected = [1.5811388492584229]
    assert_elements_in_delta expected, Khiva::Statistics.sample_stdev(tss).to_a
  end

  def test_skewness
    expected = [0]
    assert_elements_in_delta expected, Khiva::Statistics.skewness(tss).to_a
  end

  def tss
    Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
  end
end
