#include<stdio.h>

int main(int argv, char** argc){
	__int64_t t[1000000]; //one million integers
	// ./receive > re.txt
	FILE *fp=fopen("re.txt","r");
    // only read 10 thousands
	for(int i = 0; i < 100000; i++){
        //file scanner from fp file pointer
        // scans one integer per call, and updates its
        // pointer to next integer in the file
		fscanf(fp,"%ld",&t[i]); //ld long integer
	}
	__int64_t result[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	int right = 0;
	for(int i = 0; i < 12500; i++) {
        //chunks of 8 integer elements together because it is 64 bit system
        //each iteration performs total 8 values of t[i]
        //when i=0, there are total 8 if statements from 0 till 7
        //t[0].....[7] = total 64 bits
        //then each time each value (i.e., t[i] falls in between certain range
        // increase right value by 1

		// The range of values depends on the processor
		if(t[i * 8] > 1750 && t[i * 8] < 1890) {
			right++;
		} else {
			printf("0, %ld\n", t[i * 8]);
		}
		if(t[i * 8 + 1] > 1660 && t[i * 8 + 1] < 1750) {
			right++;
		} else {
			printf("1, %ld\n", t[i * 8 + 1]);
		}
		if(t[i * 8 + 2] > 2000 && t[i * 8 + 2] < 2150) {
			right++;
		} else {
			printf("2, %ld\n", t[i * 8 + 2]);
		}
		if(t[i * 8 + 3] < 1550) {
			right++;
		} else {
			printf("3, %ld\n", t[i * 8 + 3]);
		}
		if(t[i * 8 + 4] > 2280) {
			right++;
		} else {
			printf("4, %ld\n", t[i * 8 + 4]);
		}
		if(t[i * 8 + 5] > 1550 && t[i * 8 + 5] < 1660) {
			right++;
		} else {
			printf("5, %ld\n", t[i * 8 + 5]);
		}
		if(t[i * 8 + 6] > 2150 && t[i * 8 + 6] < 2280) {
			right++;
		} else {
			printf("6, %ld\n", t[i * 8 + 6]);
		}
		if(t[i * 8 + 7] > 1890 && t[i * 8 + 7] < 2000) {
			right++;
		} else {
			printf("7, %ld\n", t[i * 8 + 7]);
		}
	}
	printf("result:%d\n", right);
	return 1;
}
