from khiva.array import *
from khiva.library import *
from khiva.matrix import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)

a1 = Array.from_list([11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11], dtype.s32)
a2 = Array.from_list([9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9], dtype.s32)
stomp_result = stomp(a1, a2, 3)

find_best_n_discords_result = find_best_n_discords(stomp_result[0], stomp_result[1], 3, 2)

print('find_best_n_discords_result')
print(find_best_n_discords_result[0].to_list())
print(find_best_n_discords_result[1].to_list())
print(find_best_n_discords_result[2].to_list())
print()

find_best_n_motifs_result = find_best_n_motifs(stomp_result[0], stomp_result[1], 3, 2)

print('find_best_n_motifs_result')
print(find_best_n_motifs_result[0].to_list())
print(find_best_n_motifs_result[1].to_list())
print(find_best_n_motifs_result[2].to_list())
print()

print('mass')
print(mass(a1, a2).to_list())
print()

print('stomp')
res = stomp(a1, a2, 3)
print(res[0].to_list())
print(res[1].to_list())
print()

print('stomp_self_join')
res = stomp_self_join(a1, 3)
print(res[0].to_list())
print(res[1].to_list())
print()

print('matrix_profile')
res = matrix_profile(a1, a2, 3)
print(res[0].to_list())
print(res[1].to_list())
print()

print('matrix_profile_self_join')
res = matrix_profile_self_join(a1, 3)
print(res[0].to_list())
print(res[1].to_list())
print()
