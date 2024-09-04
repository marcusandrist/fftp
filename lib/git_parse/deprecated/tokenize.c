#include<stdio.h>
#include<string.h>

int main() {
	char str[] = "M  ff.sh\n D test.sh\n?? gnu-c-manual";
	char *token;

	token = strtok(str, "\n");

	while (token != NULL) {
	printf("%s\n", token);

	token = strtok(NULL, "\n");
	}

	return 0;
}
