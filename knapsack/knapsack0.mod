/*********************************************
 * OPL 22.1.1.0 Model
 * Author: User
 * Creation Date: 29 mar 2023 at 10:08:50
 *********************************************/

dvar boolean x1 ;
dvar boolean x2 ;
dvar boolean x3 ;
dvar boolean x4 ;
dvar boolean x5 ;
dvar boolean x6 ;

maximize (11 * x1 + 9 * x2  + 2 * x3 + 2 * x4 + 1 * x5 + 3 * x6);

subject to { //definizione dei vincoli
   Weight: 5 * x1 +  3 * x2 + 1 * x3 + 1 * x4 + 7 * x5 + 4 * x6 <= 12;
  }