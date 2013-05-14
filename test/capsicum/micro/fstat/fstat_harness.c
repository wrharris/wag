#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/uio.h>

extern void cw_act(int);

struct fstat_rv {
  struct stat rbuf;
  int rc;
};

struct iovec* shim_fstat2(int fd)
{
  // cw_act(1);
  struct stat buf;
  int rc = fstat(fd, &buf);
  struct fstat_rv* frv = (struct fstat_rv*) malloc(sizeof(struct fstat_rv));
  frv->rbuf = buf;
  frv->rc = rc;
  struct iovec* rv = (struct iovec*) malloc(sizeof(struct iovec));
  rv->iov_base = frv;
  rv->iov_len = sizeof(struct fstat_rv);
  return rv;
}

int main(int argc, char* argv[])
{
  // cw_act(0);
  int fd = 0;
  struct iovec* rv = shim_fstat2(fd);
  int rc = ((struct fstat_rv*) rv->iov_base)->rc;
  struct stat res_stat = ((struct fstat_rv*) rv->iov_base)->rbuf;
  printf("fstat return code: %d\n", rc);
  
  // If the call was successful, then print some field of the result.
  if (!rc) {
    printf("fstat size: %ld\n", res_stat.st_size);
  }
  
  return 0;
}
