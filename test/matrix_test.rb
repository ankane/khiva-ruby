require_relative "test_helper"

class MatrixTest < Minitest::Test
  def test_find_best_n_discords
    a1 = Khiva::Array.new([11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11])
    a2 = Khiva::Array.new([9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9])
    profile, index = Khiva::Matrix.stomp(a1, a2, 3)

    discord_distances, discord_indices, subsequence_indices = Khiva::Matrix.find_best_n_discords(profile, index, 2, 2)
    assert_elements_in_delta [3.24950385, 3.24950385], discord_distances.to_a
    assert_equal [9, 0], discord_indices.to_a
    assert_equal [0, 9], subsequence_indices.to_a
  end

  def test_find_best_n_motifs
    a1 = Khiva::Array.new([11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11])
    a2 = Khiva::Array.new([9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9])
    profile, index = Khiva::Matrix.stomp(a1, a2, 3)

    motif_distances, motif_indices, subsequence_indices = Khiva::Matrix.find_best_n_motifs(profile, index, 2, 2)
    assert_elements_in_delta [0, 0], motif_distances.to_a
    assert_equal [9, 9], motif_indices.to_a
    assert_equal [1, 3], subsequence_indices.to_a
  end
end
