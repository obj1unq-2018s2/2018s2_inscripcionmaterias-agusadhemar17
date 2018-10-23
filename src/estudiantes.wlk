import materias.*
import carrera.*

class Estudiante {

	var materiasAprobadas = []
	// var materiasInscripto=[]
	var correlativas = #{ correlativas.materias() } // conjunto de materias
	var creditos = 0
	var anioEnCurso

	method puedoCursar(materia) {
		return not self.yaLaCurse(materia) 
		and self.aprobeCorrelativas(materia) 
		and (materia.creditosNecesarios(materia) <= creditos)
		and anioQueCorresponde 
	}

	method yaLaCurse(materia) {
		return materiasAprobadas.contains(materia)
	}

	method aprobeCorrelativas(materia) {
		return materiasAprobadas.contains(correlativas)
	}

	method esMateriaDeMiCarrera(materia) {
	// return carrera.materias().contains(materia)
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

}

//#{1, 2}.equals(#{2, 1})
//#{1, 2}.intersection(#{5, 2}) => #{2} 