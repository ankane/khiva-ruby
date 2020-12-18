from khiva.array import *
from khiva.library import *
from khiva.matrix import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)

a1 = Array.from_list([11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11], dtype.s32)
a2 = Array.from_list([9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9], dtype.s32)
stomp_result = stomp(a1, a2, 3)

print('stomp')
print(stomp_result)
print()

find_best_n_discords_result = find_best_n_discords(stomp_result[0], stomp_result[1], 2, 2)

print('find_best_n_discords_result')
print(find_best_n_discords_result[0].to_list())
print(find_best_n_discords_result[1].to_list())
print(find_best_n_discords_result[2].to_list())
print()

find_best_n_motifs_result = find_best_n_motifs(stomp_result[0], stomp_result[1], 2, 2)

print('find_best_n_motifs_result')
print(find_best_n_motifs_result[0].to_list())
print(find_best_n_motifs_result[1].to_list())
print(find_best_n_motifs_result[2].to_list())
print()
