import materias.*
import carrera.*



class Estudiante {

	var materiasAprobadas = []
	var materiasInscripto = []
	var correlativas = materia.materiasCorrelativas() 
	var creditos = 0
	//var anioEnCurso = anio.curso()

	method puedoCursar(materia) {
		return not self.yaLaAprobe(materia) 
		and self.aprobeCorrelativas(materia) 
		and (materia.creditosNecesarios(materia) <= creditos)
		and self.termineCursoAnterior()
	
	}

	method termineCursoAnterior(){
		return materiasAprobadas.contains(correlativas)
	}
	
	method yaLaAprobe(materia) {
		return materiasAprobadas.contains(materia)
	}

	method aprobeCorrelativas(materia) {
		return materiasAprobadas.contains(correlativas)
	}

	method esMateriaDeMiCarrera(materia) {
	// return curso.materias().contains(materia)
	}

	method aprobeMateria(materia) {
		materiasAprobadas.add(materia)
		creditos += materia.creditosOtorgados()
	}

	method nota(materia) {
		if (materia.nota() >= 7) {
			self.aprobeMateria(materia)
			
		}
	}

	method meInscribi(materia) {
		materiasInscripto.add(materia)
	}

}