/* { dg-do compile } */ 
/* { dg-options "-O2 -fdump-tree-reassoc1" } */
int main(int a, int b, int c, int d)
{
  /* Should be transformed into a + c + 8 */
  int e = a + 3;
  int f = c + 5;
  int g = e + f;
  return g;
}

/* { dg-final { scan-tree-dump-times "\\\+ 8" 1 "reassoc1"} } */
/* { dg-final { cleanup-tree-dump "reassoc1" } } */
