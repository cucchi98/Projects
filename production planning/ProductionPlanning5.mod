// ProductionPlanning5.mod

// Indices are used instead of strings in arrays 
int NbProducts = ...;
range Products = 1..NbProducts;
int NbResources = ...;
range Resources = 1..NbResources;

float Demand[Resources][Products] = ... ;
float Profit[Products] = ... ;
float Availability[Resources] = ... ;
float MaxProduction = max(p in Products) (Availability[2]/Demand[2][p]);

dvar float+ production[Products] in 0..MaxProduction; 
  
// objective function
maximize 
 	sum(p in Products)
 		(Profit[p] * production[p]) -
 	sum(p in Products)
 		(Demand[1][p] * production[p]);
 
//constraints
subject to {
	forall (r in Resources)
   		ct: 
   			sum(p in Products)
   				Demand[r][p] * production[p]  <= Availability[r];
 }
 