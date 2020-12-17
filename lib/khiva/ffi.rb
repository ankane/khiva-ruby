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

    # library.h
    extern "void backend_info(char **info, int *error_code, char *error_message)"
    extern "void set_backend(const int *backend, int *error_code, char *error_message)"
    extern "void set_device(const int *device, int *error_code, char *error_message)"
    extern "void version(char **v, int *error_code, char *error_message)"

    # distances.h
    extern "void dtw(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void euclidean(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void hamming(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void manhattan(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void sbd(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void squared_euclidean(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"

    # matrix.h
    extern "void find_best_n_discords(const khiva_array *profile, const khiva_array *index, long m, long n, khiva_array *discord_distances, khiva_array *discord_indices, khiva_array *subsequence_indices, bool self_join, int *error_code, char *error_message)"
    extern "void stomp(const khiva_array *tssa, const khiva_array *tssb, long m, khiva_array *p, khiva_array *i, int *error_code, char *error_message)"

    # normalization.h
    extern "void decimal_scaling_norm(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void decimal_scaling_norm_in_place(khiva_array *tss, int *error_code, char *error_message)"
    extern "void max_min_norm(const khiva_array *tss, const double *high, const double *low, const double *epsilon, khiva_array *result, int *error_code, char *error_message)"
    extern "void max_min_norm_in_place(khiva_array *tss, const double *high, const double *low, const double *epsilon, int *error_code, char *error_message)"
    extern "void mean_norm(const khiva_array *tss, khiva_array *result, int *error_code, char *error_message)"
    extern "void mean_norm_in_place(khiva_array *tss, int *error_code, char *error_message)"
    extern "void znorm(const khiva_array *tss, const double *epsilon, khiva_array *result, int *error_code, char *error_message)"
    extern "void znorm_in_place(khiva_array *tss, const double *epsilon, int *error_code, char *error_message)"

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
