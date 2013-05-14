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

// Include the policy validators.
#include "pol_validators.h"

int shim_open(const char* path, int flags, ...);
FILE* shim_fopen(const char* path, const char * mode);

extern void cw_act(int);
extern void cw_desc(int, int);

/* Security shims for rewriting the program for Capsicum. */

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

/* shim_fopen: a security shim for fopen.
 * 
 * Parameters: same as fopen.
 *
 * Return: a FILE* constructed from a file descriptor that is a
 * capability.
 */
FILE* shim_fopen(const char* path, const char * mode) {
  /* flags: file flags defined by the mode, used to open the file
   * descriptor. */
  int flags = 0;

  if (mode[0] == 'r') {
    if (mode[1] == '+') {
      flags = O_RDWR;
    }
    else {
      flags = O_RDONLY;
    }
  }
  else if (mode[1] == 'w') {
    if (mode[1] == '+') {
      flags = O_RDWR | O_CREAT;
    }
    else {
      flags = O_WRONLY;
    }
  }
  else if (mode[0] == 'a') {
    if (mode[1] == '+') {
      flags = O_RDWR | O_APPEND | O_CREAT;
    }
    else {
      flags = O_APPEND;
    }
  }

  /* fd: capability created by the shim. */
  int fd = shim_open(path, flags, 0777);

  /* Construct a FILE* from the capability. */
  return fdopen(fd, mode);
}

int shim_access(char* path, int mode)
{
	// cw_act(12);
	int rc = access(path, mode);
	// cw_act(13);
	return rc;
}


/* shim_connect2:
 * 
 * Parameters: same as socket.
 * 
 * Returns: a capability with managed rights.
 */
int shim_connect2(int s, struct sockaddr name, socklen_t namelen) {
  // otherwise, check if the socket address is the database server.
  // cw_act(9);
  if (is_db(&name)) {
    // cw_act(9);
  }
  else {
    // cw_act(10);
  }

  // Connect the socket. If connection throws an error:
  int err = connect(s, &name, namelen);
  // cw_act(11);
  return err;
}

int shim_connect(int s, const struct sockaddr* name, socklen_t namelen)
{
	return shim_connect2(s, *name, namelen);
}

struct fstat_rv {
	struct stat rbuf;
	int rc;
};

// shim_fstat2: an RPC-partitonable function for fstat.
struct iovec* shim_fstat2(int fd)
{
	struct stat buf;

	// Get the result of fstat, store it in a buffer.
	// cw_act(14);
	int rc = fstat(fd, &buf);
	struct fstat_rv* frv =
		(struct fstat_rv*) malloc(sizeof(struct fstat_rv));
	frv->rbuf = buf;
	frv->rc = rc;

	// Store the fstat return in an iovec.
	struct iovec* rv = (struct iovec*) malloc(sizeof(struct iovec));
	rv->iov_base = frv;
	rv->iov_len = sizeof(struct fstat_rv);
	// cw_act(15);
	return rv;
}

int shim_fstat(int fd, struct stat* buf)
{
	struct iovec* res = shim_fstat2(fd);
	struct fstat_rv* rv = (struct fstat_rv*) res->iov_base;
	*buf = rv->rbuf;
	return rv->rc;
}

