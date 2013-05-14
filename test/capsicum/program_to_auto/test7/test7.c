// test7: a program which calls an internal function
// which has multiple basic blocks

int foo(int y) {
  if (y < 0) return 1;
  else return 0;
}

int main() {
  int y = 1;
  int z = foo(y);
  return z;
}
