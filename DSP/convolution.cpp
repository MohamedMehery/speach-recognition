void convolution(	float * signal_arr, unsigned int * impulse_response_arr , float * result 
						, unsigned int signal_size , unsigned int impulse_size )
							
{
	int i , j ;
	int result_size = signal_size + impulse_size - 1 ;
	for( i = 0 ; i < result_size ; i++)
	{
		result[i] = 0;	/* make result arr equal zero */
	}

	for( i = 0 ;i < signal_size ; i++)
	{
		for( j = 0 ;j < impulse_size ; j++)
		{
			result[i+j] = result[i+j] + signal[i]*impulse_response_arr[impulse_size - j - 1];
		}
	}


}								