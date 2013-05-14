#include <fcntl.h>
#include <netdb.h>
#include <netinet/in.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/uio.h>
#include <unistd.h>

extern void cw_act(int);
extern void cw_desc(int, int);

/* shim_open2: a shim for opening file descriptors.
 * 
 * Arguments: same as inputs to open.
 * 
 * Returned value: descriptor returned by open, wrapped as a capability.
 */
int shim_open2(const char* path, int flags, mode_t mode) {
  // Check if path satisfies each policy condition. 

  // If the flag includes that the file should be created:
  int fd = open(path, flags, mode);

  cw_act(0);
  cw_desc(0, fd);

  // Check what policy properties the path satisfies.
  if (is_wl_sys_lib(path)) {
    cw_act(1);
  }
  else if (is_php_mw_config(path)) {
    cw_act(2);
  }
  else if (is_mw_php(path)) {
    cw_act(3);
  }
  else if (is_skin(path)) {
    cw_act(4);
  }
  else if (is_scratch(path)) {
    cw_act(5);
  }
  else {
    cw_act(6);
  }

  cw_act(7);

  return fd;
}

int shim_open(const char* path, int flags, ...)
{
  mode_t mode;
  if (flags & O_CREAT) {
	va_list ap;
    va_start(ap, flags);
    mode = va_arg(ap, int);
  }
  else {
	mode = 0;
  }

  return shim_open2(path, flags, mode);
}

int main(int argc, char* argv[]) {
  cw_act(8);

  int mode = O_RDONLY;
  if (!strcmp(argv[2], "create")) {
    mode |= O_CREAT;
  }
  
  int fd = shim_open(argv[1], mode);
  close(fd);
  return 0;
}
