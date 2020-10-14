#ifndef OBJLOADER_H
#define OBJLOADER_H

#include <stdlib.h>
#include <stdio.h>

#include "utils.h"

struct model_obj {
  char * data;
};

struct model_obj
load_model_obj(const char * path_model);

#endif
