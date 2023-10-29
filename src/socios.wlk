import viajes.*

class Socio {
	const property actividades=[]
	const  actividadesMax	
	const property edad
	const property idiomas=#{}
	
	method esAdoradorSol(){
		return actividades.all({actividad=>actividad.sirveBronceado()})
	}
	
	method actividadesEsforzadas(){
		return actividades.filter({actividad=>actividad.implicaEsfuerzo()})
		}
	
	method realizar(unaActividad){
		if(unaActividad.size()>=actividadesMax){
			self.error("Numero maximo de actividades alcanzado")
		}
		actividades.add(unaActividad)
	}	
	
	method leAtrae(unaActividad)	
}

class Tranquilo inherits Socio{
	override method leAtrae(unaActividad){
		return unaActividad.dias()>=4
	}
	
}

class Coherente inherits Socio{
	override method leAtrae(unaActividad){
		return self.esAdoradorSol() and unaActividad.sirveBronceado() or unaActividad.implicaEsfuerzo()
	}
}

class Relajado inherits Socio{
	override method leAtrae(unaActividad){
		return unaActividad.idiomas().contains(idiomas)
	}
}