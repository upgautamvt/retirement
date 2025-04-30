#include<stdlib.h>
#include<stdio.h>

int main(int argv, char** argc){
	__int64_t t[1000000];
	// ./recieve > re.txt
	FILE *fp=fopen("re.txt","r");
	for(int i = 0; i < 100000; i++){
		fscanf(fp,"%ld",&t[i]);
	}
	__int64_t result[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	int right = 0;
	for(int i = 0; i < 12500; i++) {
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
