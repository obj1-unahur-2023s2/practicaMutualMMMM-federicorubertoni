import socios.*

class Viaje{
	const property idiomas = #{}
		
	method implicaEsfuerzo()
	method sirveBronceado()
	method dias()
	method esInteresante(){
		return idiomas.size()>=2
	}
	
	method esRecomendada(unSocio){
		return self.esInteresante() and unSocio.leAtrae(self) and not unSocio.actividades().contains(self)
	}
	
}

class Playa inherits Viaje{
	const largoDePlaya
	
	override method dias(){
	return	largoDePlaya/500
	}
	
	override method implicaEsfuerzo(){
		return largoDePlaya>1200
	}
	
	override method sirveBronceado(){
		return true
	}
	
}

class Ciudad inherits Viaje{
	var atracciones
	
	override method dias(){
		return atracciones/2
	}
	override method implicaEsfuerzo(){
		return atracciones.between(5,8)
	}
	override method sirveBronceado(){
		return false
	}
	override method esInteresante(){
		return super() or atracciones==5
	}
	
}

class CiudadTroplical inherits Ciudad{
	override method dias(){
		return super()+1
	}
	override method sirveBronceado(){
		return true
	}
}

class Trekking inherits Viaje{
	const kmSenderos
	const diasDeSol
	
	override method dias(){
		return kmSenderos/50
	}
	
	override method implicaEsfuerzo(){
		return kmSenderos>80
	}
	override method sirveBronceado(){
		return diasDeSol>200 or (diasDeSol.between(100,200) and kmSenderos>120)
	}
	
	override method esInteresante(){
		return super () and diasDeSol>140
	}
}

class Gimnasia inherits Viaje{
	override method idiomas(){
		return #{"espaniol"}
	}
	override method dias(){
		return 1
	}
	override method implicaEsfuerzo(){
		return true
	}
	override method sirveBronceado(){
		return false
	}
	override method esRecomendada(unSocio){
		return unSocio.edad().between(20,30)
	}
}
