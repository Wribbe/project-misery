#include "utils.h"
#include "objloader.h"

struct model_obj
load_model_obj(const char * path_model)
{
  size_t size_data = 0;
  char * data = file_read(path_model, &size_data);
  if (data == NULL) {
    ERR("Could not load any data for model: %s\n", path_model);
    return (struct model_obj){0};
  }
  return (struct model_obj){0};
}
