//ProductionPlanning2.mod

// declares a set of strings Products that represents the set of products
{string} Products = {"pliers", "wrenches"};
/* declares an array of two decision variables production["pliers"] 
and production["wrenches"] */
dvar float+ production[Products] in 0..14/0.001; //non-negative decision variable
 
 // objective function
 maximize 
 6 * production["pliers"] + 5 * production["wrenches"] - 
 1.5 * production["pliers"] - production["wrenches"]; //uguale al precedente con array
 
 //constraints
 subject to {
   budget: 1.5 * production["pliers"] +  production["wrenches"] <= 18000;
   time: 0.001 * production["pliers"] + 0.001 * production["wrenches"] <= 14;  
 }