int n =...;
//int m =...;
range vertici = 0..n-1;
//range marchi = 0..m-1;
range colori = 0..n-1;

int archi[vertici][vertici] = ...;

dvar boolean y[colori];
dvar boolean x[vertici][colori]; // soluzione 3, 30 variabili, 30 vincoli
//dvar float x[vertici][colori] in 0..1; // soluzione 2

minimize 
	sum(j in colori)
	  	y[j];
	  	
subject to
{
	forall(i in vertici)
		sum(j in colori)
		  	x[i][j] == 1;
		  	
	forall (n1 in vertici, n2 in n1+1..n-1, c in colori)
	  	if (archi[n1][n2] == 1)
	  		x[n1][c] + x[n2][c] <= y[c];
}

//{int} nodesof [c in colori] = {n | n in nodi : }

