#ifndef UTILS_H
#define UTILS_H

#include <stdio.h>
#include <stdlib.h>

#define ERR(f, ...) fprintf(stderr, "[!] "f, __VA_ARGS__)
#define INFO(f, ...) fprintf(stdout, "[.] "f, __VA_ARGS__)

char *
file_read(const char * path_file, size_t * size_read);

#endif
