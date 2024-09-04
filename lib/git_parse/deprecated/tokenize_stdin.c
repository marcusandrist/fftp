#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int main() {

	char payload[256];
	fgets(payload, sizeof(payload), stdin);
	printf("piped input: %s", payload);

	return 0;
}
