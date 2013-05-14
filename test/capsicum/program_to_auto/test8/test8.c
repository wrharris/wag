// test7: internal function called from multiple places

int foo(int y) {
  return y+1;
}

int main() {
  int a = 0;
  int y = 1;
  int z = -1;
  if (a < 0)  foo(y);
  else foo(z);
  return 0;
}
