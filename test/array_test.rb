require_relative "test_helper"

class ArrayTest < Minitest::Test
  def test_from_array
    a = Khiva::Array.new([[1, 2, 3], [4, 5, 6]])
    assert_equal [3, 2, 1, 1], a.dims
    assert_equal :s64, a.type
  end

  def test_from_array_float
    a = Khiva::Array.new([[1.0, 2, 3], [4, 5, 6]])
    assert_equal :f64, a.type
  end

  def test_copy
    a = Khiva::Array.new([1, 2, 3])
    b = a.copy
    assert_equal [1, 2, 3], b.to_a
    c = a.dup
    assert_equal [1, 2, 3], c.to_a
    d = a.clone
    assert_equal [1, 2, 3], d.to_a
  end

  def test_operations
    a = Khiva::Array.new([10, 20, 30])
    b = Khiva::Array.new([5, 10, 15])
    c = Khiva::Array.new([1, 2, 1])
    assert_equal [15, 30, 45], (a + b).to_a
    assert_equal [5, 10, 15], (a - b).to_a
    assert_equal [50, 200, 450], (a * b).to_a
    assert_equal [2, 2, 2], (a / b).to_a
    assert_equal [0, 0, 0], (a % b).to_a
    assert_equal [10, 400, 30], (a ** c).to_a
  end

  def test_comparison
    a = Khiva::Array.new([1, 2, 3])
    b = Khiva::Array.new([2, 2, 2])
    assert_equal [true, false, false], a.lt(b).to_a
    assert_equal [false, false, true], a.gt(b).to_a
    assert_equal [true, true, false], a.le(b).to_a
    assert_equal [false, true, true], a.ge(b).to_a
    assert_equal [false, true, false], a.eq(b).to_a
    assert_equal [true, false, true], a.ne(b).to_a
  end
end
