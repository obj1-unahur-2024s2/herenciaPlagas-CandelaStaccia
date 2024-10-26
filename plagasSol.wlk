class Plaga {
    var poblacion

    method transmiteEnfermedades() = poblacion >= 10

    method atacar(elemento) {
        elemento.recibirAtaque(self)
        self.efectoDelAtaque()
    }

    method efectoDelAtaque() {
        poblacion = poblacion * 1.1
    }

    method poblacion() = poblacion
}


class Cucarachas inherits Plaga {
    var pesoPromedio

    method nivelDeDanio() = poblacion / 2

    override method transmiteEnfermedades() = super() && pesoPromedio >= 10

    method pesoPromedio() = pesoPromedio

    override method efectoDelAtaque() {
        super()
        pesoPromedio = pesoPromedio + 2
    }
}


class Pulgas inherits Plaga {
    method nivelDeDanio() = poblacion * 2
}


class Garrapatas inherits Pulgas {
    override method efectoDelAtaque() {
        poblacion = poblacion * 1.2
    }
}


class Mosquitos inherits Plaga {
    method nivelDeDanio() = poblacion

    override method transmiteEnfermedades() = super() && poblacion % 3 == 0
}