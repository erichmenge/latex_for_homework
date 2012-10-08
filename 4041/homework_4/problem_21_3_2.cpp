int DisjointSets::iterative_findset(int i) {
  int original_i = i;

  while(p[i] != i)
    i = p[i];

  int root = p[i];

  i = original_i;

  while(i != root) {
    int next = p[i];
    p[i] = root;
    i = next;
  }
  return p[root];
}
