require_relative "test_helper"

class NormalizationTest < Minitest::Test
  def test_decimal_scaling_norm
    tss = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    expected = [0.1, 0.2, 0.3, 0.4, 0.5]
    assert_elements_in_delta expected, Khiva::Normalization.decimal_scaling_norm(tss).to_a
  end

  def test_decimal_scaling_norm_in_place
    tss = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    expected = [0.1, 0.2, 0.3, 0.4, 0.5]
    Khiva::Normalization.decimal_scaling_norm!(tss)
    assert_elements_in_delta expected, tss.to_a
  end

  def test_max_min_norm
    tss = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    expected = [0.0, 0.25, 0.5, 0.75, 1.0]
    assert_elements_in_delta expected, Khiva::Normalization.max_min_norm(tss).to_a
  end

  def test_max_min_norm_in_place
    tss = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    expected = [0.0, 0.25, 0.5, 0.75, 1.0]
    Khiva::Normalization.max_min_norm!(tss)
    assert_elements_in_delta expected, tss.to_a
  end

  def test_mean_norm
    tss = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    expected = [-0.5, -0.25, 0.0, 0.25, 0.5]
    assert_elements_in_delta expected, Khiva::Normalization.mean_norm(tss).to_a
  end

  def test_mean_norm_norm_in_place
    tss = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    expected = [-0.5, -0.25, 0.0, 0.25, 0.5]
    Khiva::Normalization.mean_norm!(tss)
    assert_elements_in_delta expected, tss.to_a
  end

  def test_znorm
    tss = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    expected = [-1.4142135381698608, -0.7071067690849304, 0.0, 0.7071067690849304, 1.4142135381698608]
    assert_elements_in_delta expected, Khiva::Normalization.znorm(tss).to_a
  end

  def test_znorm_in_place
    tss = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    expected = [-1.4142135381698608, -0.7071067690849304, 0.0, 0.7071067690849304, 1.4142135381698608]
    Khiva::Normalization.znorm!(tss)
    assert_elements_in_delta expected, tss.to_a
  end
end
