int n = ...;
int K = ...;
range vertex = 0..n-1;
range colors = 0..n-1;
range n_clique = 0..K-1;
//range e = 0..m-1;

//int archi[vertex][vertex] =...;
int clique[n_clique][vertex] = ...;

dvar boolean y[colors];
//dvar boolean x[vertex][colors]; //165 vincoli, 30 variabili
dvar float x[vertex][colors] in 0..1; //rilassamento continuo 3 come intero

minimize 
	sum (i in colors)
	  y[i];
	  
subject to{
  forall(i in vertex)
    sum (j in colors)
      x[i][j]  == 1;
      
   forall(k in n_clique, j in colors)
     sum(i in vertex)
       x[i][j]*clique[k][i] <= y[j];
}