// test0: a really simple test program.

int f(int x) {
  return x + 2;
}

int g(int x) {
  return f(x) + f(x);
}

int h(int x) {
  return x + 2;
}

int main()
{
  int a;
  int b;

  a = a + b;
  a = a + h(b);
  a = a + g(b);
  return a;
}
