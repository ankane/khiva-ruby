module Khiva
  module FFI
    extend Fiddle::Importer

    libs = Khiva.ffi_lib.dup
    begin
      dlload Fiddle.dlopen(libs.shift)
    rescue Fiddle::DLError => e
      retry if libs.any?
      raise e if ENV["KHIVA_DEBUG"]
      raise LoadError, "Khiva not found"
    end

    typealias "bool", "char"

    # array.h
    extern "void create_array(const void *data, unsigned int ndims, const long long *dims, khiva_array *result, int type, int *error_code, char *error_message)"
    extern "void delete_array(khiva_array *array, int *error_code, char *error_message)"
    extern "void display(const khiva_array *array, int *error_code, char *error_message)"
    extern "void get_data(const khiva_array *array, void *data, int *error_code, char *error_message)"
    extern "void get_dims(const khiva_array *array, long long *dims, int *error_code, char *error_message)"
    extern "void get_type(const khiva_array *array, int *t, int *error_code, char *error_message)"
    extern "void join(int dim, const khiva_array *first, const khiva_array *second, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_add(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_mul(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_sub(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_div(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_mod(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_pow(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_lt(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_gt(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_le(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_ge(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_eq(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_ne(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_bitand(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_bitor(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_bitxor(const khiva_array *lhs, const khiva_array *rhs, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_bitshiftl(const khiva_array *array, int n, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_bitshiftr(const khiva_array *array, int n, khiva_array *result, int *error_code, char *error_message)"
    extern "void khiva_not(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void copy(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"

    # clustering.h
    extern "void k_means(const khiva_array *tss, const int *k, khiva_array *centroids, khiva_array *labels, const float *tolerance, const int *max_iterations, int *error_code, char *error_message)"
    extern "void k_shape(const khiva_array *tss, const int *k, khiva_array *centroids, khiva_array *labels, const float *tolerance, const int *max_iterations, int *error_code, char *error_message)"

    # dimensionality.h
    extern "void paa(const khiva_array *a, const int *bins, khiva_array *result, int *error_code, char *error_message)"
    extern "void pip(const khiva_array *a, const int *number_ips, khiva_array *result, int *error_code, char *error_message)"
    extern "void pla_bottom_up(const khiva_array *ts, const float *max_error, khiva_array *result, int *error_code, char *error_message)"
    extern "void pla_sliding_window(const khiva_array *ts, const float *max_error, khiva_array *result, int *error_code, char *error_message)"
    extern "void ramer_douglas_peucker(const khiva_array *points, const double *epsilon, khiva_array *res_points, int *error_code, char *error_message)"
    extern "void sax(const khiva_array *a, const int *alphabet_size, khiva_array *result, int *error_code, char *error_message)"
    extern "void visvalingam(const khiva_array *points, const int *num_points, khiva_array *res_points, int *error_code, char *error_message)"

    # features.h
    extern "void abs_energy(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void absolute_sum_of_changes(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void aggregated_autocorrelation(const khiva_array *array, const int *aggregation_function, khiva_array *result, int *error_code, char *error_message)"
    extern "void aggregated_linear_trend(const khiva_array *array, const long *chunkSize, const int *aggregation_function, khiva_array *slope, khiva_array *intercept, khiva_array *rvalue, khiva_array *pvalue, khiva_array *stderrest, int *error_code, char *error_message)"
    extern "void approximate_entropy(const khiva_array *array, const int *m, const float *r, khiva_array *result, int *error_code, char *error_message)"
    extern "void cross_covariance(const khiva_array *xss, const khiva_array *yss, const bool *unbiased, khiva_array *result, int *error_code, char *error_message)"
    extern "void auto_covariance(const khiva_array *array, const bool *unbiased, khiva_array *result, int *error_code, char *error_message)"
    extern "void cross_correlation(const khiva_array *xss, const khiva_array *yss, const bool *unbiased, khiva_array *result, int *error_code, char *error_message)"
    extern "void auto_correlation(const khiva_array *array, const long *max_lag, const bool *unbiased, khiva_array *result, int *error_code, char *error_message)"
    extern "void binned_entropy(const khiva_array *array, const int *max_bins, khiva_array *result, int *error_code, char *error_message)"
    extern "void c3(const khiva_array *array, const long *lag, khiva_array *result, int *error_code, char *error_message)"
    extern "void cid_ce(const khiva_array *array, const bool *zNormalize, khiva_array *result, int *error_code, char *error_message)"
    extern "void count_above_mean(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void count_below_mean(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void cwt_coefficients(const khiva_array *array, const khiva_array *width, const int *coeff, const int *w, khiva_array *result, int *error_code, char *error_message)"
    extern "void energy_ratio_by_chunks(const khiva_array *array, const long *num_segments, const long *segment_focus, khiva_array *result, int *error_code, char *error_message)"
    extern "void fft_aggregated(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void fft_coefficient(const khiva_array *array, const long *coefficient, khiva_array *real, khiva_array *imag, khiva_array *absolute, khiva_array *angle, int *error_code, char *error_message)"
    extern "void first_location_of_maximum(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void first_location_of_minimum(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void friedrich_coefficients(const khiva_array *array, const int *m, const float *r, khiva_array *result, int *error_code, char *error_message)"
    extern "void has_duplicates(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void has_duplicate_max(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void has_duplicate_min(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void index_mass_quantile(const khiva_array *array, const float *q, khiva_array *result, int *error_code, char *error_message)"
    extern "void kurtosis(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void large_standard_deviation(const khiva_array *array, const float *r, khiva_array *result, int *error_code, char *error_message)"
    extern "void last_location_of_maximum(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void last_location_of_minimum(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void length(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void linear_trend(const khiva_array *array, khiva_array *pvalue, khiva_array *rvalue, khiva_array *intercept, khiva_array *slope, khiva_array *stdrr, int *error_code, char *error_message)"
    extern "void local_maximals(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void longest_strike_above_mean(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void longest_strike_below_mean(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void max_langevin_fixed_point(const khiva_array *array, const int *m, const float *r, khiva_array *result, int *error_code, char *error_message)"
    extern "void maximum(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void mean(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void mean_absolute_change(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void mean_change(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void mean_second_derivative_central(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void median(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void minimum(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void number_crossing_m(const khiva_array *array, const int *m, khiva_array *result, int *error_code, char *error_message)"
    extern "void number_cwt_peaks(const khiva_array *array, const int *max_w, khiva_array *result, int *error_code, char *error_message)"
    extern "void number_peaks(const khiva_array *array, const int *n, khiva_array *result, int *error_code, char *error_message)"
    extern "void partial_autocorrelation(const khiva_array *array, const khiva_array *lags, khiva_array *result, int *error_code, char *error_message)"
    extern "void percentage_of_reoccurring_datapoints_to_all_datapoints(const khiva_array *array, const bool *is_sorted, khiva_array *result, int *error_code, char *error_message)"
    extern "void percentage_of_reoccurring_values_to_all_values(const khiva_array *array, const bool *is_sorted, khiva_array *result, int *error_code, char *error_message)"
    extern "void quantile(const khiva_array *array, const khiva_array *q, const float *precision, khiva_array *result, int *error_code, char *error_message)"
    extern "void range_count(const khiva_array *array, const float *min, const float *max, khiva_array *result, int *error_code, char *error_message)"
    extern "void ratio_beyond_r_sigma(const khiva_array *array, const float *r, khiva_array *result, int *error_code,vchar *error_message)"
    extern "void ratio_value_number_to_time_series_length(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void sample_entropy(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void skewness(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void spkt_welch_density(const khiva_array *array, const int *coeff, khiva_array *result, int *error_code, char *error_message)"
    extern "void standard_deviation(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void sum_of_reoccurring_datapoints(const khiva_array *array, const bool *is_sorted, khiva_array *result, int *error_code, char *error_message)"
    extern "void sum_of_reoccurring_values(const khiva_array *array, const bool *is_sorted, khiva_array *result, int *error_code, char *error_message)"
    extern "void sum_values(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void symmetry_looking(const khiva_array *array, const float *r, khiva_array *result, int *error_code, char *error_message)"
    extern "void time_reversal_asymmetry_statistic(const khiva_array *array, const int *lag, khiva_array *result, int *error_code, char *error_message)"
    extern "void value_count(const khiva_array *array, const float *v, khiva_array *result, int *error_code, char *error_message)"
    extern "void variance(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"
    extern "void variance_larger_than_standard_deviation(const khiva_array *array, khiva_array *result, int *error_code, char *error_message)"

    # library.h
    extern "void backend_info(char **info, int *error_code, char *error_message)"
    extern "void set_backend(const int *backend, int *error_code, char *error_message)"
    extern "void get_backend(int *backend, int *error_code, char *error_message)"
    extern "void get_backends(int *backends, int *error_code, char *error_message)"
    extern "void set_device(const int *device, int *error_code, char *error_message)"
    extern "void get_device_id(int *device_id, int *error_code, char *error_message)"
    extern "void get_device_count(int *device_count, int *error_code, char *error_message)"
    extern "void set_device_memory_in_gb(const double *memory, int *error_code, char *error_message)"
    extern "void version(char **v, int *error_code, char *error_message)"

    # linalg.h
    extern "void lls(const khiva_array *a, const khiva_array *b, khiva_array *result, int *error_code, char *error_message)"

    # distances.h
    extern "void dtw(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void euclidean(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void hamming(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void manhattan(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void sbd(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void squared_euclidean(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"

    # matrix.h
    extern "void find_best_n_discords(const khiva_array *profile, const khiva_array *index, long m, long n, khiva_array *discord_distances, khiva_array *discord_indices, khiva_array *subsequence_indices, bool self_join, int *error_code, char *error_message)"
    extern "void find_best_n_motifs(const khiva_array *profile, const khiva_array *index, long m, long n, khiva_array *motif_distances, khiva_array *motif_indices, khiva_array *subsequence_indices, bool self_join, int *error_code, char *error_message)"
    extern "void find_best_n_occurrences(const khiva_array *q, const khiva_array *t, long n, khiva_array *distances, khiva_array *indexes, int *error_code, char *error_message)"
    extern "void mass(const khiva_array *q, const khiva_array *t, khiva_array *distances, int *error_code, char *error_message)"
    extern "void stomp(const khiva_array *tssa, const khiva_array *tssb, long m, khiva_array *p, khiva_array *i, int *error_code, char *error_message)"
    extern "void stomp_self_join(const khiva_array *tss, long m, khiva_array *p, khiva_array *i, int *error_code, char *error_message)"
    extern "void matrix_profile(const khiva_array *tssa, const khiva_array *tssb, long m, khiva_array *p, khiva_array *i, int *error_code, char *error_message)"
    extern "void matrix_profile_self_join(const khiva_array *tss, long m, khiva_array *p, khiva_array *i, int *error_code, char *error_message)"
    extern "void matrix_profile_lr(const khiva_array *tss, long m, khiva_array *pleft, khiva_array *ileft, khiva_array *pright, khiva_array *iright, int *error_code, char *error_message)"
    extern "void get_chains(const khiva_array *tss, long m, khiva_array *chains, int *error_code, char *error_message)"

    # normalization.h
    extern "void decimal_scaling_norm(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void decimal_scaling_norm_in_place(khiva_array *tss, int *error_code, char *error_message)"
    extern "void max_min_norm(const khiva_array *tss, const double *high, const double *low, const double *epsilon, khiva_array *result, int *error_code, char *error_message)"
    extern "void max_min_norm_in_place(khiva_array *tss, const double *high, const double *low, const double *epsilon, int *error_code, char *error_message)"
    extern "void mean_norm(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void mean_norm_in_place(khiva_array *tss, int *error_code, char *error_message)"
    extern "void znorm(const khiva_array *tss, const double *epsilon, khiva_array *result, int *error_code, char *error_message)"
    extern "void znorm_in_place(khiva_array *tss, const double *epsilon, int *error_code, char *error_message)"

    # polynomial.h
    extern "void polyfit(const khiva_array *x, const khiva_array *y, const int *deg, khiva_array *result, int *error_code, char *error_message)"
    extern "void roots(const khiva_array *p, khiva_array *result, int *error_code, char *error_message)"

    # regression.h
    extern "void linear(const khiva_array *xss, const khiva_array *yss, khiva_array *slope, khiva_array *intercept, khiva_array *rvalue, khiva_array *pvalue, khiva_array *stderrest, int *error_code, char *error_message)"

    # regularization.h
    extern "void group_by(const khiva_array *array, const int *aggregation_function, const int *n_columns_key, const int *n_columns_value, khiva_array *result, int *error_code, char *error_message)"

    # statistics.h
    extern "void covariance_statistics(const khiva_array *tss, const bool *unbiased, khiva_array *result, int *error_code, char *error_message)"
    extern "void kurtosis_statistics(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void ljung_box(const khiva_array *tss, const long *lags, khiva_array *result, int *error_code, char *error_message)"
    extern "void moment_statistics(const khiva_array *tss, const int *k, khiva_array *result, int *error_code, char *error_message)"
    extern "void quantile_statistics(const khiva_array *tss, const khiva_array *q, const float *precision, khiva_array *result, int *error_code, char *error_message)"
    extern "void quantiles_cut_statistics(const khiva_array *tss, const float *quantiles, const float *precision, khiva_array *result, int *error_code, char *error_message)"
    extern "void sample_stdev_statistics(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void skewness_statistics(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"

    class << self
      # thread-safe
      def error_code
        Thread.current[:khiva_error_code] ||= Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT)
      end

      # thread-safe
      def error_message
        Thread.current[:khiva_error_message] ||= Fiddle::Pointer.malloc(256)
      end

      def call(method, *args)
        FFI.send(method, *args, error_code, error_message)
        if error_code.to_s(error_code.size).unpack1("i*") != 0
          raise Error, error_message.to_s
        end
      end
    end
  end
end
