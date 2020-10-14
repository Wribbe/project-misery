#include "utils.h"

char *
file_read(const char * path_file, size_t * size_read)
{
  FILE * fh = fopen(path_file, "r");

  if (fh == NULL) {
    ERR("Could not open %s.\n", path_file);
    return NULL;
  }

  return "";
}
