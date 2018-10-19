import deposito.*
import formaciones.*
import vagones.*

class Locomotora {
	
	var property peso //propiedad de peso
	var property arrastre 
	var property velocidad 
	
	constructor (peso_,arrastre_,velocidad_) {
		peso = peso_
		arrastre = arrastre_
		velocidad = velocidad_
	}
	
	//punto 3
	method esEficiente(){
	   return arrastre > peso * 5
	} 
	
	method arrastreUtil(){
		return arrastre - peso
	}
}






