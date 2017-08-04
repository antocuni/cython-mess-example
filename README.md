This example shows what bad things can happen when you change Cython structs
under the feet of another module.

Try this:

1. Compile `a.pyx` and `b.pyx` as they are; the fields of `a.A` are of type
   `int`:
   

```
$ cat a.pxd
cdef class A(object):
    cdef readonly int x
    cdef readonly int y

$ cythonize -bi a.pyx b.pyx
...

$ python try.py
x = 0x1234
y = 0x5678
```


2. Modify `a.pxd` so that the fields are of type `short`. Then, recompile
   **only** `a.pyx`:
   
```
$ cat a.pxd
cdef class A(object):
    cdef readonly short x
    cdef readonly short y

$ cythonize -bi a.pyx
...

$ python try.py
x = 0x56781234
y = 0x0
```
