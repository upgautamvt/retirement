
#include<stdio.h>

int main(){
	__int64_t t[1000000];
	FILE *fp=fopen("re0.txt","r");
	int  num=0;
	int result = 0;
	int result2 = 0;
	__int64_t one_result = 0;
	__int64_t mean = 0;
	int real = 0;
	for(int i = 0;i < 800000;i++){
		fscanf(fp,"%ld",&t[i]);
	}
	for(int j = 10000;j < 40000;j++){
		for(int i = 1; i < 10; i++) {
			if (t[j * 20 + i] > 750 && t[j * 20 + i - 1] < 750) {
				num++;
				mean = mean + t[j * 20 + i - 1];
				one_result = t[j * 20 + i - 1];
				//one_result = (t[j * 10 + i - 1] + t[j * 10 + i - 2]) / 2;
				//printf("%d,%ld\n",i-1,one_result);
				if (one_result < 670) {
					real++;
				}
				break;
			}
		} 
			
	}
	printf("result:%d, %ld, %d\n", num, mean / num, real);
	return 1;
}
