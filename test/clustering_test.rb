require_relative "test_helper"

class ClusteringTest < Minitest::Test
  def test_k_means
    tss = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    centroids, labels = Khiva::Clustering.k_means(tss, 2)
    expected = [[0.0, 0.0, 0.0, 0.0, 0.0], [1.0, 2.0, 3.0, 4.0, 5.0]]
    assert_elements_in_delta expected, centroids
    assert_elements_in_delta [1], labels
  end

  def test_k_shape
    tss = Khiva::Array.new([1, 2, 3, 4, 5], type: :f32)
    centroids, labels = Khiva::Clustering.k_shape(tss, 2)
    expected = [[2.0, -0.5, -0.5, -0.5, -0.5], [0.0, 0.0, 0.0, 0.0, 0.0]]
    assert_elements_in_delta expected, centroids
    assert_elements_in_delta [0], labels
  end
end
