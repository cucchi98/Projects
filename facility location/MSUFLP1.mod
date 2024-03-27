//Multi Source Uncapacitated Facility Location Problem (MS-UFLP1)

int NbClients = ...;
int NbLocations = ...;
range Locations = 0..NbLocations-1;
range Clients = 0..NbClients-1;
int OpeningCost[Locations] = ...;
int ShippingCost[Clients][Locations] = ...;
int Capacity[Locations] = ...; // not used
int Demand[Clients] = ...; // not used							
dvar boolean Open[Locations];
dvar float+ Supply[Clients][Locations] in 0..1; 
//rilasso la variabile, consento piu di una locazione che serve lo stesso cliente


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

{int} Clientsof[l in Locations] = { c | c in Clients : Supply[c][l] > 0 };
execute DISPLAY_RESULTS{
writeln("Open=",Open);
writeln("Supply=",Supply);
writeln("Clientsof=",Clientsof);
}
