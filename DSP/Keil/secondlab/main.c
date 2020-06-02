#include "stm32f10x.h"                  // Device header
#include "signals.h"
#include "fft.h"


extern const int32_t lowpassfilter[wavesignal_size];
extern const float inputSignal_f32_1kHz_15kHz[wavesignal_size];
void fftconv(const real* signal , uint32_t signalsize , const int32_t *filter ,float* output);

int main()
{
		//PI = atan2(1, 1) * 4;
		float lowpass_result[wavesignal_size]={0}; 	/* sram is not enough */
		static float current_value = 0 ;	/* this variable must be static to get view on logic analyzer */
		static float lpresult_value = 0 ;
		static int filter_value = 0 ;
		int i = 0;
		for(i = 0 ; i < 320 ; i += 2 )
		{
			fftconv(&inputSignal_f32_1kHz_15kHz[i],2,&lowpassfilter[i],&lowpass_result[i]);
		}
	while(1)
	{
				/* display original wave and output of moving average filter */
		for( i = 0 ; i < wavesignal_size ; i++)
		{
			current_value = inputSignal_f32_1kHz_15kHz[i];
			lpresult_value = lowpass_result[i];
		}
		
		
	}	
	return 0;
}


void fftconv( const real* signal , uint32_t signalsize ,const int32_t *filter ,float* output)
{
	int i;
	complex sig[signalsize];
	complex filt[signalsize];
	complex temp[signalsize];
	
	for(i = 0 ; i < signalsize ; i++)
	{
		sig[i].Re = signal[i];
		filt[i].Re = filter[i];
	}
	
	fft(sig,signalsize,temp);
	fft(filt,signalsize,temp);
	for(i = 0 ; i < signalsize ; i++)
	{
		temp[i].Re = sig[i].Re * filt[i].Re;
		temp[i].Im = sig[i].Im * filt[i].Im;
	}
	ifft(temp,signalsize,sig);
	for(i = 0 ; i < signalsize ; i++)
	{
		output[i] = sqrt(temp[i].Re * temp[i].Re + temp[i].Im * temp[i].Im);
	}
	
		
}