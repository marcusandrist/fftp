#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 85

long find_section_offset(const char *file_path, const char *hotkey) {
    FILE *file = fopen(file_path, "r");
    char line [MAX_LINE_LENGTH];
    long offset = 0;

    while (fgets(line, sizeof(line), file)) {
        if (strstr(line, hotkey)) {
            fclose(file);
            return offset;
        }
        offset += strlen(line);
    }
    fclose(file);
        return -1;
}

// Function to adjust a hotkey in the configuration file
void adjust_hotkey(const char *file_path, const char *hotkey_name, const char *new_value) {
    FILE *file = fopen(file_path, "r+");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }

    // Locate the [HOTKEYS] section
    long hotkeys_offset = find_section_offset(file_path, "[HOTKEYS]");
    if (hotkeys_offset == -1) {
        fclose(file);
        fprintf(stderr, "HOTKEYS section not found in the file.\n");
        return;
    }

    // Move to the start of the HOTKEYS section
    fseek(file, hotkeys_offset, SEEK_SET);

    char line[MAX_LINE_LENGTH];
    char temp_file[] = "temp.ini";
    FILE *temp = fopen(temp_file, "w");
    if (temp == NULL) {
        perror("Error creating temporary file");
        fclose(file);
        return;
    }

    int hotkey_found = 0;

    // Adjust the hotkey by searching for the specific hotkey name
    while (fgets(line, sizeof(line), file)) {
        if (strncmp(line, hotkey_name, strlen(hotkey_name)) == 0) {
            fprintf(temp, "%s=%s\n", hotkey_name, new_value);
            hotkey_found = 1;
        } else {
            fputs(line, temp);
        }
    }

    if (!hotkey_found) {
        fprintf(temp, "%s=%s\n", hotkey_name, new_value);
    }

    fclose(file);
    fclose(temp);

    // Replace the original file with the modified temp file
    remove(file_path);
    rename(temp_file, file_path);
}

int main() {
    const char *config_file = "hotkeys.file";
    adjust_hotkey(config_file, "copy", "Ctrl+Shift+C");
    adjust_hotkey(config_file, "testcommand", "Ctrl+Shift+F");
    return 0;
}
