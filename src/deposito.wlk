
object deposito {
	
	var formaciones = []
	var locomotoras = []
	
	method agregarFormacion(formacion){
		formaciones.add(formacion)
	}
	
	method quitarFormacion(formacion){
		formaciones.remove(formacion)
	}
	
	method agregarLocomotora(locomotora){
		locomotoras.add(locomotora)
	}
	
	method quitarLocomotora(locomotora){
		locomotoras.remove(locomotora)
	}
	
	//punto 6
	method vagonesMasPesados(){
		return formaciones.map{formacion => formacion.vagonMasPesado()}
	}
	
	//punto 7
	/*
	 * Si alguna formacion en compleja, se necesita un conductor experimentado. Delego en Formacion saber si es compleja o no
	 */
	method necesitaConductorExperimentado(){
		formaciones.any{formacion => formacion.esCompleja()}
	}
	
	//punto 8
	method agregarLocomotoraA(formacion){
		if (!formacion.puedeMoverse() and self.tieneLocomotoraPara(formacion)){
			formacion.agregarLocomotora(self.locomotoraPara(formacion))
		}
	}
	
	method tieneLocomotoraPara(formacion){
		return self.locomotoraPara(formacion) != null
	}
	
	method locomotoraPara(formacion){
		return locomotoras.findOrDefault({locomotora => locomotora.arrastreUtil() >= formacion.empujeFaltante()}, null)
	}
}
