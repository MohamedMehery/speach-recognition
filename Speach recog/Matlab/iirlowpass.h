/*
 * Filter Coefficients (C Source) generated by the Filter Design and Analysis Tool
 * Generated by MATLAB(R) 8.1 and the Signal Processing Toolbox 6.19.
 * Generated on: 17-May-2020 23:50:00
 */

/*
 * Discrete-Time IIR Filter (real)
 * -------------------------------
 * Filter Structure    : Direct-Form II, Second-Order Sections
 * Number of Sections  : 17
 * Stable              : Yes
 * Linear Phase        : No
 */

/* General type conversion for MATLAB generated C-code  */
#include "tmwtypes.h"
/* 
 * Expected path to tmwtypes.h 
 * C:\Program Files\MATLAB\R2013a\extern\include\tmwtypes.h 
 */
#define MWSPT_NSEC 35
const int NL[MWSPT_NSEC] = { 1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1 };
const real64_T NUM[MWSPT_NSEC][3] = {
  {
    0.03937696429287,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.03802911026292,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.03678607817846,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
     0.0356460074734,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.03460622596154,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.03366356048306,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.03281457981592,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.03205578119848,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.03138373106923,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.03079516941758,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.03028708576075,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.02985677339569,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.02950186731882,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.02922037010155,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.02901066906533,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.02887154730507,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
    0.02880219044436,                 0,                 0 
  },
  {
                   1,                 2,                 1 
  },
  {
                   1,                 0,                 0 
  }
};
const int DL[MWSPT_NSEC] = { 1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1 };
const real64_T DEN[MWSPT_NSEC][3] = {
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.806897611151,   0.9644054683221 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.745048398784,   0.8971648398358 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.688009169267,   0.8351534819806 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.635694546479,   0.7782785763726 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.587981911347,   0.7264068151935 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.544725656535,   0.6793798984675 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,    -1.50576833296,   0.6370266522234 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.470949208789,   0.5991723335824 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.440110727587,    0.565645651864 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.413103296682,   0.5362839743527 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.389788773527,     0.51093711657 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.370042955168,   0.4894700487505 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.353757318273,   0.4717647875487 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.340840206491,    0.457721686897 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.331217618559,   0.4472602948199 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.324833714142,   0.4403199033622 
  },
  {
                   1,                 0,                 0 
  },
  {
                   1,   -1.321651123808,   0.4368598855853 
  },
  {
                   1,                 0,                 0 
  }
};
