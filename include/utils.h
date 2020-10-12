#ifndef UTILS_H
#define UTILS_H

#include <stdio.h>

#define ERR(f, ...) fprintf(stderr, "[!] "f, __VA_ARGS__)
#define INFO(f, ...) fprintf(stdout, "[.] "f, __VA_ARGS__)

#endif
