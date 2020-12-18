require_relative "test_helper"

class DistancesTest < Minitest::Test
  def test_dtw
    expected = [[0, 0, 0], [5, 0, 0], [10, 5, 0]]
    assert_elements_in_delta expected, Khiva::Distances.dtw(tss)
  end

  def test_euclidean
    expected = [[0.0, 0.0, 0.0], [2.2360680103302, 0.0, 0.0], [4.4721360206604, 2.2360680103302, 0.0]]
    assert_elements_in_delta expected, Khiva::Distances.euclidean(tss)
  end

  def test_hamming
    expected = [[0, 0, 0], [5, 0, 0], [5, 5, 0]]
    assert_elements_in_delta expected, Khiva::Distances.hamming(tss)
  end

  def test_manhattan
    expected = [[0, 0, 0], [5, 0, 0], [10, 5, 0]]
    assert_elements_in_delta expected, Khiva::Distances.manhattan(tss)
  end

  def test_sbd
    expected = [[0, 0, 0], [-9223372036854775808, 0, 0], [-9223372036854775808, -9223372036854775808, 0]]
    assert_elements_in_delta expected, Khiva::Distances.sbd(tss)
  end

  def test_squared_euclidean
    expected = [[0, 0, 0], [5, 0, 0], [20, 5, 0]]
    assert_elements_in_delta expected, Khiva::Distances.squared_euclidean(tss)
  end

  def tss
    Khiva::Array.new([[1, 1, 1, 1, 1], [2, 2, 2, 2, 2], [3, 3, 3, 3, 3]])
  end
end
