class Carrera {
	 
	var property materias=[]
	
	method materiasAnio(anio) {
    	return materias.filter { materia => materia.anio() == anio }
    }
}

