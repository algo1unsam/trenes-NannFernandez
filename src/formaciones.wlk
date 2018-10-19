import deposito.*
import locomotoras.*

class Formacion {
	
	var locomotoras = []
	var vagones = []
	
	method agregarVagon(vagon){
		vagones.add(vagon)
	}
	
	method quitarVagon(vagon){
		vagones.remove(vagon)
	}
	
	method agregarLocomotora(locomotora){
		locomotoras.add(locomotora)
	}
	
	method quitarLocomotora(locomotora){
		locomotoras.remove(locomotora)
	}
	
	//punto 1
	method cantidadVagonesLivianos(){
		return vagones.count {vagon => vagon.esLiviano()}
	}
	
	//punto 2
	method velocidadMaxima(){
		return locomotoras.min{ locomotora => locomotora.velocidad()}
	}
	 
	 //punto3
	method esEficiente(){
		return locomotoras.all{locomotora => locomotora.esEficiente()} 
	}
	
	//punto 4
	method puedeMoverse(){
		return self.arrastreUtilFormacion() >= self.pesoTotalVagones() 
	}
	
	method arrastreUtilFormacion(){
		return locomotoras.sum{locomotora => locomotora.arrastreUtil()}
	}
	
	/*
	 * Calcula el peso total de la formacion delegando en dos submetodos de la misma clase
	 */
	method pesoTotalFormacion(){
		return self.pesoTotalVagones() + self.pesoTotalLocomotoras()
	}
	
	/*
	 * Calcula el peso total de los vagones. Para eso, consulta y suma el peso maximo de cada vagon.
	 * Delega en vagon el calculo del peso maximo
	 */
	method pesoTotalVagones(){
		return vagones.sum{vagon => vagon.pesoMaximo()}
	}
	
	/*
	 * Calcula el peso total de las locomotoras. Delega en la locomotora el calculo del peso
	 */
	method pesoTotalLocomotoras(){
		return locomotoras.sum{locomotora => locomotora.peso()}
	}
	
	//punto 5
	method empujeFaltante(){
		if (self.puedeMoverse()){
			return 0
		}
		else {
			return self.pesoTotalVagones() - self.arrastreUtilFormacion()
		}
	}
	
	method vagonMasPesado(){
		return vagones.max{vagon => vagon.pesoMaximo()}
	}
	
	/*
	 * Para saber si es compleja, necesita saber si tiene mas de 20 unidades o si el peso total de la formacion es mayor igual 10000
	 * Esto se resuelve delegando en otros metodos de Formacion
	 */
	method esCompleja(){
		return self.tieneMasDe20Unidades() or self.pesoTotalFormacion() >= 10000
	}
	
	/*
	 * Devuelve si la formacion tiene mas de 20 unidades. Se descompone el metodo en dos submetodos que calculan la cantidad de unidades
	 */
	method tieneMasDe20Unidades(){
		return self.cantidadLocomotoras() + self.cantidadVagones()
	}
	
	/*
	 * Calcula la cantidad de locomotoras
	 */
	method cantidadLocomotoras(){
		return locomotoras.size()
	}
	
	/*
	 * Calcula la cantidad de vagones
	 */
	method cantidadVagones(){
		return vagones.size()
	}
}