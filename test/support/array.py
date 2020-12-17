from khiva.array import *

a = Array.from_list([[1, 2, 3], [4, 5, 6]], dtype.s32)
print(a.get_dims())
print(a.get_type())

a = Array.from_list([1, 2, 3], dtype.s64)
b = Array.from_list([4, 5, 6], dtype.s64)
print((a + b).to_list())
