#import <stdio.h>

void bla(int n) {
	for (int i=0; i<n; i++) {
		printf("bla\n");
	}
}

int main(int argc, char *argv[]) {
	bla(4);
}
