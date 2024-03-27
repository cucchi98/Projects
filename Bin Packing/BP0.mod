
int mItems = ...;
int nBins = ...;
range items = 0..mItems-1; //serve da contatore nei cicli
range bins = 0..nBins-1; //serve da contatore nei cicli
int Capacity = ...;
int weights [items] = ...;
dvar float y[bins] in 0..1;
dvar float x[items][bins] in 0..1;  //30 variabili decisionali, 10 vincoli, 0.09, 2.2
//dvar boolean y[bins];
//dvar boolea x[items][bins];

minimize
  sum(p in bins)
    y[p];

subject to {
  forall (m in items)
    oneitemonebin:
    sum(n in bins)
      x[m][n] == 1;
  forall(n in bins)
    capacity:
    sum(m in items)
      weights[m] * x[m][n] <= Capacity * y[n];
  }
  
{int} itemssof[n in bins] = { i | i in items : x[i][n] > 0 };
execute DISPLAY_RESULTS{
writeln("Open=",x); //scrive in output il valore di queste 3 variabili
writeln("Supply=",y);
writeln("Clientsof=",itemssof);
}
  