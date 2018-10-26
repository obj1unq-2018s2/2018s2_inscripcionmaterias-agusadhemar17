import estudiantes.*
import materias.*
import carrera.*

class Universidad {

	var estudiantes = []
	var materias = []
	var carreras = []

	method alumnoInscriptoEnMateria(materia, estudiante) {
		return materia.alumnosInscriptos().contains(estudiante)
	}

	method puedeCursar(materia, estudiante) {
		return not self.alumnoInscriptoEnMateria(materia, estudiante) and not estudiante.materiasAprobadas().contains(materia) and materia.aproboAnioAnterior(estudiante) and materia.requisitosParaCursar(estudiante)
	}

	method alumnoAprobo(estudiante, materia, nota) {
		if (not estudiante.materiasAprobadas().contains(materia)) {
			estudiante.aprobeMateria()
		}
	}

	method materiasInscripto(estudiante) {
		return estudiante.materiasInscripto()
	}

	method esperaCupo(estudiante) {
		return estudiante.esperaEnLista()
	}

	method esperanCupo(materia) {
		return materia.listaDeEspera()
	}

}

class RegistroMateriaAprobada {

	const materia
	const alumno
	const nota

	method materia() {
		return materia
	}

	method nota() {
		return nota
	}

	method alumno() {
		return alumno
	}

}

