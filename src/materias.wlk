import estudiantes.*
import carreras.*


class Materia {

	const carrera
	const  nombre
	const curso
	
	var property creditosNecesarios
	var property mcorrelativas = []
	var property creditosOtorgados = 0
	var property alumnosInscriptos = []
	var property alumnosAprobaron = []
	
	//var property anioQueCorresponde
	var property listaDeEspera = []
	var property cupo

	method materiasCorrelativas(){
		return mcorrelativas
	}
	method inscribirAlumno(estudiante) {
		if (cupo > 0 and estudiante.puedoCursar(nombre)) {
			alumnosInscriptos.add(estudiante)
			estudiante.meInscribi(nombre)
			cupo -= 1
		} else {
			listaDeEspera.add(estudiante)
			
		}
	}

	method darBaja(estudiante) {
		alumnosInscriptos.remove(estudiante)
		if (listaDeEspera.size() > 0) {
			self.inscribirAlumno(listaDeEspera.first())
			listaDeEspera.drop(1)
		} else {
			cupo += 1
		}
	}

}


//armar
class AlumnoAprueba {

	var property alumno 
	var property materia
	var property nota
}

