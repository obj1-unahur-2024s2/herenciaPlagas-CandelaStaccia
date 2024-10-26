class Hogar {
    var mugre
    const confort

    method esBueno() {
        return mugre <= confort / 2
    }

    method recibirAtaque(plaga) {
        mugre = mugre + plaga.nivelDeDanio()
    }

    method mugre() = mugre
}


class Mascota {
    var salud

    method esBueno() = salud > 250

    method recibirAtaque(plaga) {
        if(plaga.transmiteEnfermedades())
            salud = 0.max(salud - plaga.nivelDeDanio())
    }

    method salud() = salud
}


class Huerta {
    var produccion

    method esBueno() = produccion > nivelMinimoDeProduccion.valor()

    method recibirAtaque(plaga) {
        produccion = 
        0.max(produccion - (plaga.nivelDeDanio() * 0.1 + if(plaga.transmiteEnfermedades()) 10 else 0))
    }

    method produccion() = produccion
}

object nivelMinimoDeProduccion {
    var property valor = 2000
}//un nivel que no es fijo, pero es el mismo para todas las huertas.



class Barrio {
    const property elementos = []

    method esCopado() {
        return self.elementosBuenos() > self.elementosNoBuenos()
    }

    method elementosBuenos() {
        return elementos.count({e => e.esBueno()})
    }

    method elementosNoBuenos() {
        return elementos.count({e => not e.esBueno()})
    }
}