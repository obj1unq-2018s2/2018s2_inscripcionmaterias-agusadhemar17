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
	
	// TODO Este atributo corresponde a la clase MateriaCorrelativas 
	var property mCorrelativas = []
	
	// TODO No se usa
	var property alumnosAprobaron = []
	var property cupo

	// TODO Método innecesario, si ya tenés la property
	method alumnosInscriptos() {
		return inscriptos
	}

	method inscribirAlumno(estudiante) {
		// TODO No se están validando todas las condiciones: que la materia sea de la carrera o que el estudiante no haya ya cursado la materia.
		if (cupo > 0 and self.requisitosParaCursar(estudiante)) {
			inscriptos.add(estudiante)
			
			// TODO Mejor guardar la materia, ¿por qué guardar sólo el nombre? 
			estudiante.meInscribi(nombre)
			
			// TODO Sería más sólido evitar modificar el cupo.
			cupo -= 1
		} else {
			// TODO No respeta el enunciado, no se puede poner en lista de espera si no cumple los requisitos. 
			listaDeEspera.add(estudiante)
			estudiante.miListaDeEspera().add(self)
		
			// TODO Al fallar la inscripción debería tirar excepción.
		}
	}

	method darBaja(estudiante) {
		inscriptos.remove(estudiante)
		if (listaDeEspera.size() > 0) {
			self.inscribirAlumno(listaDeEspera.first())
			
			// TODO Drop no tiene efecto, deberías usar remove.
			listaDeEspera.drop(1)

			// TODO Falta modificar la lista de materias en espera del estudiante.
		} else {
			cupo += 1
		}
	}

	method requisitosParaCursar(estudiante) {
		// TODO Si nadie llama a super, mejor usar un método abstracto.
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
		// TODO Habiendo "all" no tiene sentido usar "size" para comprobar que "todos" los elementos del conjunto cumplen una condición, es una solución frágil. 
		return estudiante.aprobadasdelAnioAnterior().size() == carrera.materiasAnio(anio).size()
	}

}
