from a cimport A

cpdef dump_a(A obj):
    print 'x = 0x%x' % obj.x
    print 'y = 0x%x' % obj.y
