

/*dvar float+ pi1 in 0..40;
dvar float+ pi2 in 0..50;
dvar float+ pi3 in 0..20/0.3;
dvar float po1 ;
dvar float po2 ;
dvar float po3 ;
dvar boolean x1 ;
dvar boolean x2 ;
dvar boolean x3 ;*/


{string} Products = ...;
//{string} Products_activation = ...;
{string} Resources = ... ;

float Demand[Products] = ...;
float Capacity[Resources] = ...;
float Inside_cost[ Products ] = ...;
float Outside_cost[ Products ] = ...;
float Fixed_cost[ Products ] = ...;
float Resource_consumption [Resources][Products] = ...;
float M = ...;

dvar float+ inside_production[Products] in 0..20/0.3;
dvar float+ outside_production[Products];
dvar boolean activation[Products];

minimize 
 	sum(p in Products)
 		(Inside_cost[p] * inside_production[p] + Outside_cost[p] * outside_production[p] + Fixed_cost[p] * activation[p]);
 		
 
  subject to {
 	forall (r in Resources)
   		ct:
   			sum(p in Products)
   				Resource_consumption[r][p] * inside_production[p]  <= Capacity[r];
   	forall (p in Products)
   		ct1: 
   			inside_production[p] + outside_production[p]  >= Demand[p];
   	forall (p in Products)
   	     	ct2:
   	     		inside_production[p] <= M * activation[p];
 }
 
 