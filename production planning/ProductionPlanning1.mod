// ProductionPlanning1.mod

// declares two decision variables of type float
// float+ : non-negative decision variable
dvar float+ pliers in 0..14/0.001;   //variaibile decisionale preceduta da dvar
dvar float+ wrenches in 0..14/0.001; //+valori non negativi
 
// objective function
maximize (6 * pliers + 5 * wrenches - 1.5 * pliers - wrenches); 
//minimize se di minimo
//constraints
subject to { //definizione dei vincoli
   budget: 1.5 * pliers +  wrenches <= 18000;
   time: 0.001 * pliers + 0.001 * wrenches <= 14;  
}