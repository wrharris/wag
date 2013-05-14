#include <stdio.h>

extern void foo(int);

extern int bar();

int main() {
  int x = 0;
  int y = 0;

  while (x * x < 20) {
  lab0:
    foo(x);
    y = y + x;
    x++;
  }

  return y;
}
