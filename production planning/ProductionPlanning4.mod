// ProductionPlanning4.mod

// declaration of input data but the initization is given in a data file 
{string} Products = ...;
{string} Resources = ... ;

/* two dimensional array whose element Demand[r][p] represents the demand 
  of product p for resource r
  */
 float Demand[Resources][Products] = ... ;
 // array representing the profit of each product
 float Profit[Products] = ... ;
 // array representing the availability of budget (cost) and time (plant)
 float Availability[Resources] = ... ;
 // Value used to compute the upper bound of decision variables
 float MaxProduction = max(p in Products) (Availability["time"]/Demand["time"][p]);
 

/* declares an array of two decision variables production indexed by Products */
 dvar float+ production[Products] in 0..MaxProduction; // non-negative decision variable
 
 // objective function
  maximize  
 	sum(p in Products)
 		(Profit[p] * production[p] - Demand["cost"][p] * production[p]);
 
 //constraints
 subject to {
 	forall (r in Resources)
   		ct: 
   			sum(p in Products)
   				Demand[r][p] * production[p]  <= Availability[r];
 }