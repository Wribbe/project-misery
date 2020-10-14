#include "utils.h"

char *
file_read(const char * path_file, size_t * p_size_read)
{
  FILE * fh = fopen(path_file, "r");

  if (fh == NULL) {
    ERR("Could not open %s.\n", path_file);
    return NULL;
  }

  fseek(fh, 0, SEEK_END);
  size_t size_file = ftell(fh);
  rewind(fh);

  char * data = malloc(size_file+1);
  if (data == NULL) {
    ERR("Could not allocate data file: %s.\n", path_file);
    return NULL;
  }

  size_t size_read = 0;
  while (size_read < size_file) {
    size_read += fread(data+size_read, 1, size_file-size_read, fh);
  }

  fclose(fh);
  data[size_file] = '\0';

  if (p_size_read != NULL) {
    *p_size_read = size_read+1;
  }

  return data;
}
