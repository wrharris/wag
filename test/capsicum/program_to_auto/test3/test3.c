// test3: a program which calls an external function

#include <unistd.h>

int main() {
  int y = 1;
  int z = getpid();
  return z;
}
