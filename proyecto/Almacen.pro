/*****************************************************************************

		Copyright (c) My Company

 Project:  ALMACEN
 FileName: ALMACEN.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "almacen.inc"
  
  
domains

	identificador=integer
	diaentrada=integer
	diasalida=integer
	box=b(identificador,diaentrada,diasalida)
	lbox=box*
	actual=integer
	limite=integer
	pila=p(lbox,actual,limite)
	almacen=pila*
	
predicates
		
	/*perteneceapila(lbox, pila)*//*obtenemos la lista de cajas de la pila*/
	/*pilavacia(pila)*/
	nondeterm cima(box,lbox)/*obtenemos la caja que se encuentra en la cima de la pila, es decir la ultima de lbox*/

	/*movercaja(pila,pila)*//*movemos la caja de una pila a otra para colocarla*/
	caja_valida(box,box)/*comparamos las fechas de salidas de la caja seleccionada y 
	la de la cima de la pila*/
	/*escribe(almacen)*//*escribimos la salida del programa*/
	/***
	****/
	nondeterm pila(lbox,pila)
	nondeterm resuelve(lbox,almacen)

	
		
clauses




	/*comprobar la cajas*/
	cima(Box,[Box]).
	cima(Box,[_|Resto]):-
		cima(Box,Resto).
				
	caja_valida(b(IN,DentN,DsalN),b(IA,DentA,DsalA)):-
		DsalA >= DsalN.
		
	resuelve(_,Almasenaje).
		/*write(Almasenaje, "\n").*/
			
	resuelve(Lbox,Almasenaje):-
		Pila=p(Apiladas,Actual,Limite),
		pila(Lbox,Pila),
		resuelve(NLbox,[Pila|Almasenaje]).
			
			
	pila(_,p(_,4,_)).
	
	pila([Primero|Cola],p(Apiladas,0,Limite)):-
		NuevoLbox=[Primero],
		NuevoActual=1,
		pila(Cola,p(NuevoLbox,NuevoActual,Limite)).	
			
	pila([Primero|Cola],p(Lbox,Actual,Limite)):-
		cima(Box,Lbox),
		caja_valida(Primero,Box),
		NuevoLbox=[Primero|Lbox],
		NuevoActual=Actual+1,
		pila(Cola,p(NuevoLbox,NuevoActual,Limite)).
		
		
		
		
	

goal

  
  	resuelve([b(9,1,17),b(10,1,17),b(11,1,17),b(12,1,17),b(13,1,17),b(14,1,17),b(15,1,17),b(16,1,17),b(17,1,17),b(18,1,17),b(19,1,17),b(20,1,17),b(3,1,18),b(4,1,18),b(5,1,18),b(6,1,18),b(7,1,18),b(8,1,18),b(1,1,19),b(2,1,19)],Almasen).
	