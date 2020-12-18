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

  def test_stomp
    a1 = Khiva::Array.new([11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11])
    a2 = Khiva::Array.new([9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9])
    profile, index = Khiva::Matrix.stomp(a1, a2, 3)

    expected = [3.2495038509368896, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.2495038509368896]
    assert_elements_in_delta expected, profile
    assert_elements_in_delta [9, 9, 9, 9, 9, 9, 9, 9, 9, 0], index
  end

  def test_stomp_self_join
    a1 = Khiva::Array.new([11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11])
    profile, index = Khiva::Matrix.stomp_self_join(a1, 3)

    expected = [2.135256290435791, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.135256290435791]
    assert_elements_in_delta expected, profile
    assert_elements_in_delta [9, 9, 9, 9, 9, 9, 9, 4, 5, 0], index
  end

  def test_matrix_profile
    skip if ENV["CI"] # TODO debug

    a1 = Khiva::Array.new([11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11])
    a2 = Khiva::Array.new([9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9])
    profile, index = Khiva::Matrix.matrix_profile(a1, a2, 3)

    expected = [1.7320508075688772, 2.449489742783178, 2.449489742783178, 2.449489742783178, 2.449489742783178, 2.449489742783178, 2.449489742783178, 2.449489742783178, 2.449489742783178, 1.7320508075688772]
    assert_elements_in_delta expected, profile
    assert_elements_in_delta [9, 0, 1, 2, 3, 4, 5, 6, 7, 0], index
  end

  def test_matrix_profile_self_join
    skip if ENV["CI"] # TODO debug

    a1 = Khiva::Array.new([11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11])
    profile, index = Khiva::Matrix.matrix_profile_self_join(a1, 3)

    expected = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    assert_elements_in_delta expected, profile
    assert_elements_in_delta [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], index
  end
end
