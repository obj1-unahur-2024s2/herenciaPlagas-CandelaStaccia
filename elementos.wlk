class Hogar {
    var property nivelMugre
    var property confort

    method esBueno() {
        return nivelMugre <= confort / 2
    }

    method recibirAtaqueDe(unaPlaga) {
        nivelMugre = nivelMugre + unaPlaga.nivelDanio()
    }
}


class Huerta {
    var property capacidadProduccion
    var property nivelProduccion = 100
    //un nivel que no es fijo, pero es el mismo para todas las huertas. ?

    method esBueno() {
        return capacidadProduccion > nivelProduccion
    }

    method recibirAtaqueDe(unaPlaga) {
        if(unaPlaga.puedeTransmitir())
            capacidadProduccion = 0.max(capacidadProduccion - (unaPlaga.nivelDanio() * 0.1 + 10))
        else
            capacidadProduccion = 0.max(capacidadProduccion - (unaPlaga.nivelDanio() * 0.1))

    }
} 


class Mascota {
    var nivelDeSalud

    method esBueno() {
        return nivelDeSalud > 250
    }

    method recibirAtaqueDe(unaPlaga) {
        if(unaPlaga.puedeTransmitir())
            nivelDeSalud = 0.max(nivelDeSalud - unaPlaga.nivelDanio())
    }

    method nivelDeSalud() = nivelDeSalud
}


class Barrio {
    const property elementos = []

    method esCopado() {
        const elementosBuenos = elementosBuenos.count({e => e.esBueno()})
        const elementosNoBuenos = elementosBuenos.count({e => not e.esBueno()})
        //metodos? ^

        return elementosBuenos > elementosNoBuenos
    }
}