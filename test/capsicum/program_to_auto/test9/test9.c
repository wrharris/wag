// test9: recursive functions

int fact(int x) {
  if (x == 0) {
    return 1;
  }
  else {
    return x * fact(x-1);
  }
}

int main() {
  int x = 5;
  int y = fact(5);
  return y;
}
