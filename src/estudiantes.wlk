class Estudiante {

	var property materiasAprobadas = []
	var property materiasInscripto = []
	var property carrerasCursando = []
	var anioActual
	var property creditosTotales= 0
	var property esperoCupo

	
	
	method aprobeMateria(materia) {
		materiasAprobadas.add(materia)
		creditosTotales += materia.creditosOtorgados()
	}

	method meInscribi(materia) {
		materiasInscripto.add(materia)
	}
	
	
	method aprobadasdelAnioAnterior(){
		self.materiasAprobadas().filter({materia => materia.anio(anioActual-1)})
			
	} 
	method miListaDeEspera(){
		return esperoCupo
	}
}

