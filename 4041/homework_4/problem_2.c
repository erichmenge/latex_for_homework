void quick_sort(int *a, int p, int r) {
  if(p < r) {
    int pivot = select(a, p, r, (r - p + 1)/2);
    int q = partition(a, pivot, r);
    quick_sort(a, p, q - 1);
    quick_sort(a, q + 1, r);
  }
}
