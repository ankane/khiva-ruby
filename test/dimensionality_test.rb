require_relative "test_helper"

class DimensionalityTest < Minitest::Test
  def test_paa
    expected = [[1.0, 2.5], [4.0, 5.5]]
    assert_elements_in_delta expected, Khiva::Dimensionality.paa(tss, 2)
  end

  def test_pip
    expected = [[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]]
    assert_elements_in_delta expected, Khiva::Dimensionality.pip(tss, 3)
  end

  def test_pla_bottom_up
    expected = [[1.0, 2.0], [4.0, 5.0]]
    assert_elements_in_delta expected, Khiva::Dimensionality.pla_bottom_up(tss, 0.1)
  end

  def test_pla_sliding_window
    expected = [[1.0, 3.0], [4.0, 6.0]]
    assert_elements_in_delta expected, Khiva::Dimensionality.pla_sliding_window(tss, 0.1)
  end

  def test_ramer_douglas_peucker
    expected = [[1.0, 3.0], [4.0, 6.0]]
    assert_elements_in_delta expected, Khiva::Dimensionality.ramer_douglas_peucker(tss, 0.1)
  end

  def test_sax
    expected = [[1.0, 2.0, 3.0], [0.0, 0.0, 1.0]]
    assert_elements_in_delta expected, Khiva::Dimensionality.sax(tss, 2)
  end

  def test_visvalingam
    expected = [[1.0, 3.0], [4.0, 6.0]]
    assert_elements_in_delta expected, Khiva::Dimensionality.visvalingam(tss, 2)
  end

  def tss
    Khiva::Array.new([[1, 2, 3], [4, 5, 6]], type: :f32)
  end
end
