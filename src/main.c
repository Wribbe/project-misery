#include <stdlib.h>
#include <stdio.h>

#include "utils.h"
#include "window.h"

int
main(void)
{
  struct wWindow window = wWindow_get();
  INFO("Name of window: %s\n", window.name);
}
