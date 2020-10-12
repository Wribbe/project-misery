#ifndef WINDOW_H
#define WINDOW_H

#include "window_platform.h"

struct wWindow
wWindow_get(void);

const char *
wWindow_name_get(struct wWindow * window);

#endif
