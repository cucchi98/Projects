int n = ...;

int MS = ...;
range vertex = 0..n-1;
range colors = 0..n-1;
range n_MS = 0..MS-1;

//int archi[vertex][vertex] =...;
int stable[vertex][n_MS] = ...;

//dvar boolean x[n_MS];
dvar float x[n_MS] in 0..1; // 32 variabili, 5 vincoli, rilassamento come vc2 = 3 = intero

minimize 
	sum (m in n_MS)
	  x[m];
	  
subject to{
  forall(i in vertex)
    sum (m in n_MS)
      x[m]*stable[i][m] >= 1;  
}