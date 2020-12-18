from khiva.array import *
from khiva.library import *
from khiva.regularization import *

set_backend(KHIVABackend.KHIVA_BACKEND_CPU)

a = Array.from_list([[1, 2, 3], [4, 5, 6]], dtype.f64)

print('group_by')
print(group_by(a, 0).to_list())
print()
