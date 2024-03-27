//Multi Source Capacitated Facility Location Problem (MS-CFLP2)

int NbClients = ...;
int NbLocations = ...;
range Locations = 0..NbLocations-1;
range Clients = 0..NbClients-1;
int OpeningCost[Locations] = ...;
int Capacity[Locations] = ...;
int Demand[Clients] = ...;							
int ShippingCost[Clients][Locations] = ...;
dvar boolean Open[Locations];
dvar float+ Supply[Clients][Locations];
//quantita spedita da ciascula locazione a quel cliente
float MaxDemand = max(c in Clients)(Demand[c]);
//sceglie come big M la massima domanda tra tutti i clienti

//execute{writeln(MaxDemand);}

minimize
  sum( l in Locations ) 
    OpeningCost[l] * Open[l] +
  sum( l in Locations , c in Clients ) 
    ShippingCost[c][l] * Supply[c][l];
    
subject to{
  forall( c in Clients )
    ctClientDemandSatisfied:
      sum( l in  Locations ) 
        Supply[c][l] == Demand[c];
  forall( c in Clients, l in Locations )
    ctUseOfLocation:         
        Supply[c][l] <= MaxDemand * Open[l];    
  forall( l in Locations )
    ctMaxUseOfLocation: 
      sum( c in Clients )
        Supply[c][l] <= Capacity[l] * Open[l];
}

{int} Clientsof[l in Locations] = { c | c in Clients : Supply[c][l] > 0 };
execute DISPLAY_RESULTS{
writeln("Open=",Open);
writeln("Supply=",Supply);
writeln("Clientsof=",Clientsof);
}
