int randomized_select(int a[], int p, int r, int i) {
  int q;
  int k;
  do
  {
    if(p == r)
      return a[p];
    q = randomized_partition(a, p, r);
    k = q - p + 1;
    if(i == k)
      return a[q];
    else if(i < k)
      r = q - 1;
    else {
      p = q + 1;
      i = i - k;
    }
  } while (1);
}
