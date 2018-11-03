class Estudiante {

	var property materiasAprobadas = []
	var property materiasInscripto = []
	var property carrerasCursando = [] // TODO Esto no se usa
	var anioActual
	var property creditosTotales= 0
	var property esperoCupo

	
	
	method aprobeMateria(materia) {
		// TODO El precálculo lleva a inconsistencias, usalo sólo cuando sea indispensable y tomando los recaudos necesarios para garantizar la consistencia.
		materiasAprobadas.add(materia)
		creditosTotales += materia.creditosOtorgados()
	}

	method meInscribi(materia) {
		materiasInscripto.add(materia)
	}
	
	
	method aprobadasdelAnioAnterior(){
		// TODO No respeta el enunciado, el año a chequear es el año de la materia a la que me quiero inscribir.
		self.materiasAprobadas().filter({materia => materia.anio(anioActual-1)})
			
	} 
	method miListaDeEspera(){
		return esperoCupo
	}
}

