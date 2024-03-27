// ProductionPlanning6.mod

// Uses expressions of decision variables
int NbProducts = ...;
range Products = 1..NbProducts;
int NbResources = ...;
range Resources = 1..NbResources;

float Demand[Resources][Products] = ... ;
float Profit[Products] = ... ;
float Availability[Resources] = ... ;
float MaxProduction = max(p in Products) (Availability[2]/Demand[2][p]);

dvar float+ production[Products] in 0..MaxProduction; 
// 16-17 espressioni decisionali dexpr
dexpr float TotalProfit = sum(p in Products)(Profit[p] * production[p]);
dexpr float TotalCost = sum(p in Products)(Demand[1][p] * production[p]);

// objective function
maximize TotalProfit - TotalCost;
 
//constraints
subject to {
	forall (r in Resources)
   		ct: 
   			sum(p in Products)
   				Demand[r][p] * production[p]  <= Availability[r];
 }