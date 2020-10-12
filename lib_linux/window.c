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
