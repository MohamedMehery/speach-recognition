#include <stdio.h>

void IIRFloat(double *coeffs_B, double *coeffs_A, double *input, double *output, int length, int B_len , int A_len)
{
    double bcc, acc;
    double *coeffa, *coeffb;
    double *inputp;
    double *outputp;
    int n,k;

    //filter length =7
    for (n = 0; n < length; n++) {
        coeffa = coeffs_A;
        coeffb = coeffs_B;
        inputp = &input[B_len - 1 + n]; //insamp[6]~insamp[85]

        acc = 0;
        bcc = 0;

        for (k = 0; k < B_len; k++) {
            bcc += (*coeffb++) * (*inputp--); //b[0] * x[6] + b[1] * x[5]...+b[6] * x[0]
        }

        for (k = 1; k < A_len; k++) {
            acc += (*coeffa++) * (*output--); //a[1] * y[5] + a[2] * y[4]...+a[6] * y[0]
        }
        output[n] = bcc-acc;

    }
}
