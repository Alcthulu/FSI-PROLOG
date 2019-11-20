/**************


*******************/

domains

	identificador=integer
	diaentrada=integer
	diasalida=integer
	box=b(identificador,diaentrada,diasalida)
	lbox=box*
	actual=integer
	limite=integer
	pila=p(lbox,actual,limite)
	almacen=alm(pila,pila,pila,pila,pila)
	
predicates
		
	perteneceapila(lbox, pila)/*obtenemos la lista de cajas de la pila*/
	pilavacia(pila)
	cima(box,lbox)/*obtenemos la caja que se encuentra en la cima de la pila, es decir la ultima de lbox*/
	coloca(box,pila)/*predicado para comprobar si la caja seleccionada puede incluirse en la pila*/
	movercaja(pila,pila)/*movemos la caja de una pila a otra para colocarla*/
	caja_valida(box,box)/*comparamos las fechas de salidas de la caja seleccionada y 
	la de la cima de la pila*/
	escribe(almacen)/*escribimos la salida del programa*/
	/***
	****/
	
		
clauses

	/*comprobar la cajas*/
	cima(Box,[Box]).
	
	cima(Box,[_|Resto]):-
		cima(Box,Resto).
			
	caja_valida(b(IN,DentN,DsalN),b(IA,DentA,DsalA):-
		DsalA >= DsalN.
		
	coloca(b(I,Dent,Dsal),p(Lbox,Actual,Limite)):-
		cima(Box,Lbox),
		caja_valida(b(I,Dent,Dsal),Box).
	
		