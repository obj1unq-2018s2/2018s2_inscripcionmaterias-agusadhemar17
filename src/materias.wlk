import estudiantes.*
import carrera.*

class Materia {

	var carrera 
	var nombre
	var property anio
	var property inscriptos = []
	var property listaDeEspera = []
	var property creditosNecesarios
	var property creditosOtorgados
	var property mCorrelativas = []
	var property alumnosAprobaron = []
	var property cupo

	method alumnosInscriptos() {
		return inscriptos
	}

	method inscribirAlumno(estudiante) {
		if (cupo > 0 and self.requisitosParaCursar(estudiante)) {
			inscriptos.add(estudiante)
			estudiante.meInscribi(nombre)
			cupo -= 1
		} else {
			listaDeEspera.add(estudiante)
			estudiante.miListaDeEspera().add(self)
		
		}
	}

	method darBaja(estudiante) {
		inscriptos.remove(estudiante)
		if (listaDeEspera.size() > 0) {
			self.inscribirAlumno(listaDeEspera.first())
			listaDeEspera.drop(1)
		} else {
			cupo += 1
		}
	}

	method requisitosParaCursar(estudiante) {
		return true
	}

}

class MateriaCorrelativas inherits Materia {

	override method requisitosParaCursar(estudiante) {
		return estudiante.materiasAprobadas().contains(mCorrelativas)
	}

}

class MateriasConCreditos inherits Materia {

	override method requisitosParaCursar(estudiante) {
		return self.creditosNecesarios() <= estudiante.creditos()
	}

}

class MateriasAnioAnterior inherits Materia {

	override method requisitosParaCursar(estudiante) {
		return self.anioAnteriorAprobado(estudiante, carrera)
	}

	method anioAnteriorAprobado(estudiante, carrera) {
		return estudiante.aprobadasdelAnioAnterior().size() == carrera.materiasAnio(anio).size()
	}

}
