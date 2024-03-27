int mitems = ...;
int nbins = ...;
int npattern = ...;
range items = 0..mitems-1; //serve da contatore nei cicli
//range bins = 0..nbins-1; //serve da contatore nei cicli
range patterns = 0..npattern-1;
int capacity = ...;
int weights [items] = ...;
int Patterns [patterns][items] = ...;
//dvar boolean y[bins];
//dvar boolean x[items][bins];
//dvar boolean x[items][patterns];
//dvar boolean x[patterns]; //5 variabili, 5 vincoli, 2.5 uguale a SP
dvar float x[patterns] = 0..1;

minimize
	sum (p in patterns) 
		x[p];

subject to
{
	forall(i in items)
	vincolo:
		sum(p in patterns)
		x[p] * Patterns[p][i] >= 1; // == non funziona, soluzione impossibile
}
  
/*{int} itemssof[n in bins] = { i | i in items : x[i][n] > 0 };
execute DISPLAY_RESULTS{
writeln("Open=",x); //scrive in output il valore di queste 3 variabili
writeln("Supply=",y);
writeln("Clientsof=",itemssof);
}*/
