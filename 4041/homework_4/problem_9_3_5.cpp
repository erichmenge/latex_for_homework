int partition(int *a, int p, int r, int pivot){
 int i = p - 1;
 for(int j = p; j < r; j++){
  if(a[j] <= pivot){
   i++;
   helpers::exchange(a, i, j);
  }
 }
 helpers::exchange(a, i + 1, r);
 return i + 1;
}

int select(int *a, int p, int r, int k) {
  if (p == r) return a[p];
  int median = black_box_median(a, p, r); // returns index
  int q = partition(a, p, r, a[median]);
  if(k == q - p + 1)
    return a[q];
  else if(k < q - p + 1)
    return select(a, p, q - 1, k);
  else
    return select(a, q + 1, r, k - (q - p + 1));
}
