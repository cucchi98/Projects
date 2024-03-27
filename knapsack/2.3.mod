
{string} Objects = ...;

int Weight [Objects] = ... ;
 // array representing the profit of each object
int Profit [Objects] = ... ;
 // array representing the availability of budget (cost) and time (plant)
int Capacity = ...;
 // Value used to compute the upper bound of decision variables

dvar boolean obj[Objects];
 
 //obj function
 maximize
 	sum (o in Objects)
 	  (Profit[o] * obj[o]);
 	  
//constraints

subject to {
  sum (o in Objects)
 	  Weight[o] * obj[o] <= Capacity;
}