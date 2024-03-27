//Single Source Uncapacitated Facility Location Problem (SS-UFLP1)

int NbClients = ...;
int NbLocations = ...;
range Locations = 0..NbLocations-1;//serve da contatore nei cicli
range Clients = 0..NbClients-1;
int OpeningCost[Locations] = ...;
int ShippingCost[Clients][Locations] = ...;
int Capacity[Locations] = ...; // not used
int Demand[Clients] = ...; // not used							
//dvar boolean Open[Locations]; //y
dvar boolean Supply[Clients][Locations]; //quale locazione serve a quale cliente
// Continuous relaxation
dvar float+ Open[Locations] in 0..1;
//dvar float+ Supply[Clients][Locations] in 0..1;


minimize
  sum( l in Locations ) 
    OpeningCost[l] * Open[l] +
  sum( l in Locations , c in Clients ) 
    ShippingCost[c][l] * Supply[c][l];
    

subject to{
  forall( c in Clients )
    ctClientDemandSatisfied:
      sum( l in  Locations ) 
        Supply[c][l] == 1;
  forall( c in Clients, l in Locations )
    ctUseOfLocation:         
        Supply[c][l] <= Open[l];
}

//postprocessamenti per possibili stampe
{int} Clientsof[l in Locations] = { c | c in Clients : Supply[c][l] > 0 };
//per ciascula locazione mi mette i clienti per cui la fornitura > 0
execute DISPLAY_RESULTS{
writeln("Open=",Open); //scrive in output il valore di queste 3 variabili
writeln("Supply=",Supply);
writeln("Clientsof=",Clientsof);
}
