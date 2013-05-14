// access.c: a simple test for RPC marshalling of the access system call.
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

extern void cw_act(int);

int shim_access(const char* path, int mode)
{
  cw_act(1);
  return access(path, mode);
}

int main(int argc, char* argv[])
{
  cw_act(0);
  printf("access return code: %d\n", shim_access(argv[1], F_OK));
  return 0;
}
