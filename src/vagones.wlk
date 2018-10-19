import deposito.*
import formaciones.*
import locomotoras.*

class Vagon {
	
	method puedeLlevarPasajeros()
	method puedeLlevarCarga()
	method pesoMaximo() //lo resulven las subclases
	
	method esLiviano(){
	   return self.pesoMaximo() <= 2500
	}
}

class Pasajero inherits Vagon {
    
	var property ancho
	var property largo 
	
	/*
	 * Devuelve la cantidad de pasajeros
	 */
	method cantidadDePasajeros(){
		if (ancho < 2.5){
			return 80
		}else{
			return 100
		}
	}
	
	/*
	 * Devulve el peso maximo que es la cantidad de pasajeros * 80. Llama a otro metodo de la clase Pasajero
	 */
	override method pesoMaximo(){
		return self.cantidadDePasajeros() * 80
	} 
	
	override method puedeLlevarPasajeros(){
		return true
	}
	
	override method puedeLlevarCarga(){
		return false
	}
}

class Carga inherits Vagon{
	
	var property cargaMaxima
	
	/*
	 * Devulve el peso maximo que es la carga maxima mas 160
	 */
	override method pesoMaximo(){
		return cargaMaxima + 160
	}
	
	override method puedeLlevarPasajeros(){
		return false
	}
	
	override method puedeLlevarCarga(){
		return true
	}
}