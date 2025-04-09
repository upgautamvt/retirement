
#include<stdio.h>

int main(){
	__int64_t t[1000000];
	// ./recieve > re0.txt when secret is 'a', ./recieve > re1.txt when secret is 'T'
	FILE *fp=fopen("re0.txt","r");
	int num = 0;
	int num_one = 0;
	int result = 0;
	int result_one = 0;
	int z = 0;
	int base = 20;
	// One time above the threshold is one type of secret, all less than the threshold is another type of secret
	int th = 1;
	for(int i = 0;i < 800000;i++){
		fscanf(fp,"%ld",&t[i]);
	}
	// Five counts as one attack
	int times = 5;
	// First 3000 removals to exclude noise
	for(int j = 3000;j < 7000;j++){
		num_one = 0;
		result_one = 0;
		for(z = 0; z < times; z++){
			for(int i = 1; i < 10; i++) {
				// 790 represents the start of nop-loop, depending on process
				if (t[j * times * base + i + base * z] > 790 && t[j * times * base + i + base * z - 1] < 790) {
					num_one++;
					// threshold is 665, depending on process, geted by analyze.c
					if(t[j * times * base + i - 1  + base * z] < 665){
						result_one++;
						
					}
					break;
				}
			} 
		}
		if(num_one == 0) continue;
		num++;

		if(result_one > th) result++;
	}
	// Number of correct or incorrect guesses, depending on whether the file is re0.txt or re1.txt
	printf("result:%d, %d\n", result, num);
	return 1;
}
