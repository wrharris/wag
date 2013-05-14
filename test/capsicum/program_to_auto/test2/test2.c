// test2: a program which calls an internal function

int foo() {
  int x = 0;
  return x;
}

int main() {
  int y = 1;
  int z = foo();
  return z;
}
