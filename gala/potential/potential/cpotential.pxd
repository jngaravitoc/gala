cdef extern from "potential/src/cpotential.h":
    ctypedef struct CPotential:
        pass

cpdef _validate_pos_arr(double[:,::1] arr)

cdef class CPotentialWrapper:
    cdef CPotential cpotential
    cdef double[::1] _params
    cdef int[::1] _n_params
    cdef list _potentials # HACK: for CCompositePotentialWrapper

    cpdef energy(self, double[:,::1] q, double[::1] t)
    cpdef density(self, double[:,::1] q, double[::1] t)
    cpdef gradient(self, double[:,::1] q, double[::1] t)
    cpdef hessian(self, double[:,::1] q, double[::1] t)

    cpdef d_dr(self, double[:,::1] q, double G, double[::1] t)
    cpdef d2_dr2(self, double[:,::1] q, double G, double[::1] t)
    cpdef mass_enclosed(self, double[:,::1] q, double G, double[::1] t)
