import estudiantes.*
import materias.*

class Carrera {

	
	var property cursos =[]
	method alumnosInscriptosPorMateria(materia) {
		return materia.alumnosInscriptos()
	}

}

class Curso{
	
	var property anio
	var materias = []
	
}
