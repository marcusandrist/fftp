#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main() {

	char payload[256];
	fgets(payload, sizeof(payload), stdin);
	char *lines[50];
	char git_labels[100] = "";
	int lines_processed = 0;

	// Tokenize the payload
	char *token = strtok(payload, "\n");

	// Grab first two characters (git labels)
	while (token != NULL && lines_processed < 50) {
		lines[lines_processed++] = token;

		if (strlen(token) >= 2) {
			strncat(git_labels, token, 2);
		}

		token = strtok(NULL, "\n");
	}

	printf("List of git labels:\n\t%s\n", git_labels);

	return 0;
}
