//Multi Source Capacitated Facility Location Problem (MS-CFLP1)

int NbClients = ...;
int NbLocations = ...;
range Locations = 0..NbLocations-1;
range Clients = 0..NbClients-1;
int OpeningCost[Locations] = ...;
int Capacity[Locations] = ...;
int Demand[Clients] = ...;							
int ShippingCost[Clients][Locations] = ...;
dvar boolean Open[Locations];
dvar float+ Supply[Clients][Locations] in 0..1; 
//da single source a multi sourse abbiamo solo modificato il dominio delle variabili

minimize
  sum( l in Locations ) 
    OpeningCost[l] * Open[l] +
  sum( l in Locations , c in Clients ) 
    ShippingCost[c][l] * Demand[c] * Supply[c][l];
    
subject to{
  forall( c in Clients )
    ctClientDemandSatisfied:
      sum( l in  Locations ) 
        Supply[c][l] == 1;
  forall( c in Clients, l in Locations )
    ctUseOfLocation:         
        Supply[c][l] <= Open[l];    
  forall( l in Locations )
    ctCapacityOfLocation:         
      sum( c in Clients ) 
        Demand[c] * Supply[c][l] <= Capacity[l] * Open[l];
}

{int} Clientsof[l in Locations] = { c | c in Clients : Supply[c][l] > 0 };
execute DISPLAY_RESULTS{
writeln("Open=",Open);
writeln("Supply=",Supply);
writeln("Clientsof=",Clientsof);
}
