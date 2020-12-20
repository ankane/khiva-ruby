module Khiva
  module Matrix
    class << self
      def find_best_n_discords(profile, index, m, n, self_join: false)
        discord_distances = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        discord_indices = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        subsequence_indices = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        FFI.call(:find_best_n_discords, profile, index, m, n, discord_distances, discord_indices, subsequence_indices, self_join ? 1 : 0)
        [Array.new(discord_distances), Array.new(discord_indices), Array.new(subsequence_indices)]
      end

      def find_best_n_motifs(profile, index, m, n, self_join: false)
        motif_distances = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        motif_indices = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        subsequence_indices = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        FFI.call(:find_best_n_motifs, profile, index, m, n, motif_distances, motif_indices, subsequence_indices, self_join ? 1 : 0)
        [Array.new(motif_distances), Array.new(motif_indices), Array.new(subsequence_indices)]
      end

      def find_best_n_occurrences(q, t, n)
        distances = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        indices = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        FFI.call(:find_best_n_occurrences, q, t, n, distances, indices)
        [Array.new(distances), Array.new(indices)]
      end

      def mass(q, t)
        distances = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        FFI.call(:mass, q, t, distances)
        Array.new(distances)
      end

      def stomp(tssa, tssb, m)
        profile = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        index = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        FFI.call(:stomp, tssa, tssb, m, profile, index)
        [Array.new(profile), Array.new(index)]
      end

      def stomp_self_join(tss, m)
        profile = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        index = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        FFI.call(:stomp_self_join, tss, m, profile, index)
        [Array.new(profile), Array.new(index)]
      end

      def matrix_profile(tssa, tssb, m)
        profile = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        index = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        FFI.call(:matrix_profile, tssa, tssb, m, profile, index)
        [Array.new(profile), Array.new(index)]
      end

      def matrix_profile_self_join(tss, m)
        profile = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        index = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        FFI.call(:matrix_profile_self_join, tss, m, profile, index)
        [Array.new(profile), Array.new(index)]
      end

      def chains(tss, m)
        chains = Fiddle::Pointer.malloc(Fiddle::SIZEOF_VOIDP)
        FFI.call(:get_chains, tss, m, chains)
        Array.new(chains)
      end
    end
  end
end
