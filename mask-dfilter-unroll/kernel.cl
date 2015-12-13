#pragma OPENCL EXTENSION cl_khr_fp64 : enable
// m0 m1 m2
// m3 m4 m5
// m6 m7 m8
__kernel void mask_dfilter_unroll(__global double *src, __global double *dst, long ldc, __global short *mask,
  double m0, double m1, double m2, double m3, double m4, double m5, double m6, double m7, double m8)
{
  long x = get_global_id(0);
  long y = 1*get_global_id(1);
  
  if(mask[x+y*ldc]) {
    double i0 = src[(x-1)+(y-1)*ldc]*m0;
    double i1 = src[(x)  +(y-1)*ldc]*m1;
    double i2 = src[(x+1)+(y-1)*ldc]*m2;
    double i3 = src[(x-1)+(y)  *ldc]*m3;
    double i4 = src[(x)  + y  * ldc]*m4;
    double i5 = src[(x+1)+(y)  *ldc]*m5;
    double i6 = src[(x-1)+(y+1)*ldc]*m6;
    double i7 = src[(x)  +(y+1)*ldc]*m7;
    double i8 = src[(x+1)+(y+1)*ldc]*m8;
  
    dst[x+y*ldc] = i0 + i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8;
  }
  if(mask[x+(y+1)*ldc]) {
    double i10 = src[(x-1)+((y+1)-1)*ldc]*m0;
    double i11 = src[(x)  +((y+1)-1)*ldc]*m1;
    double i12 = src[(x+1)+((y+1)-1)*ldc]*m2;
    double i13 = src[(x-1)+((y+1))  *ldc]*m3;
    double i14 = src[(x)  + (y+1)  * ldc]*m4;
    double i15 = src[(x+1)+((y+1))  *ldc]*m5;
    double i16 = src[(x-1)+((y+1)+1)*ldc]*m6;
    double i17 = src[(x)  +((y+1)+1)*ldc]*m7;
    double i18 = src[(x+1)+((y+1)+1)*ldc]*m8;
  
    dst[x+(y+1)*ldc] = i10 + i11 + i12 + i13 + i14 + i15 + i16 + i17 + i18;
  }
}
