//ProductionPlanning3.mod

// declares a set of strings of products and resources
{string} Products = {"pliers", "wrenches"};
{string} Resources = {"cost", "time"};

/* two dimensional array whose element Demand[r][p] represents the demand 
 of resource r by product p */
 float Demand[Resources][Products] = [ [1.5, 1], [0.001, 0.001] ];
 // array representing the profit of each product
 float Profit[Products] = [6, 5];
 // array representing the availability of budget (cost) and time (plant)
 float Availability[Resources] = [18000, 14];
 // Value used to compute the upper bound of decision variables
 float MaxProduction = max(p in Products) (Availability["time"]/Demand["time"][p]);
 
/* execute{
   writeln(MaxProduction);
   }*/

/* declares an array of two decision variables production["pliers"] 
and production["wrenches"] */
 dvar float+ production[Products] in 0..MaxProduction; //non-negative decision variable
 
 
 // objective function
 // the aggregate operator sum takes the summation fo the individual components
 maximize 
 	sum(p in Products)
 		(Profit[p] * production[p]) -
 	sum(p in Products)
 		(Demand["cost"][p] * production[p]);
 
 //constraints
 subject to {
   // the universal quantifier forall generates a constraint for each resource
	forall (r in Resources) //ciclo for di c
   		ct: 
   			sum(p in Products)
   				Demand[r][p] * production[p]  <= Availability[r];
 }
 
 execute{
   writeln("The optimal production is ", production);
   }