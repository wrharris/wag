// test6: while loops + if statements


int main() {
  
  int x = 0;
  int sum = 0;
  while (x < 100) {
    if (x % 3 == 0) {
      sum++;
    }
    x++;
  }
  return 0;
}
