#include <stdlib.h>
#include <stdio.h>

#include "window.h"

struct wWindow
wWindow_get(void)
{
  return (struct wWindow) {
    .name = "HELLO"
  };
}


const char *
wWindow_name_get(struct wWindow * window)
{
  return window->name;
}
