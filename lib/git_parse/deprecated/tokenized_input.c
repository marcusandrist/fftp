#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define MAX_BUFFER 256

int main(int argc, char *argv[]) {

	char buffer[MAX_BUFFER];
	char *title;

	if (argc > 1) {
		
		size_t arg_length = strlen(argv[1]);
		
		if (arg_length >= MAX_BUFFER) {
			fprintf(stderr, "git status --porcelain=v1 result too long");
			return 1;
		}

	}	else {
		fprintf(stderr, "found no payload\n");
		return 1;
		}

	strncpy(buffer, argv[1], MAX_BUFFER - 1);

	title = strtok(argv[0], "/");
	title = strtok(NULL, "/");

	printf("Found input and it is: %s\n", buffer);
	printf("Diagnostics:\n\tprogram name: %s\n\targc value: %i\n\tbuffer size: %lu\n", title, argc, sizeof(buffer));

	return 0;
}
