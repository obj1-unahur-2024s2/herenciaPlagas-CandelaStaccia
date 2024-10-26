class Plaga {
    var property poblacion

    method puedeTransmitir() {
        return poblacion >= 10
    }

    method atacar() {
        poblacion = poblacion * 1.1
    }

    method atacarA(unElemento) {
        self.atacar()
        unElemento.recibirAtaqueDe(self)
    }
}


class PlagaCucarachas inherits Plaga {
    var pesoPromedio

    method nivelDanio() = poblacion / 2

    override method puedeTransmitir() {
        return super() && pesoPromedio >= 10
    }

    override method atacar() {
        super()
        pesoPromedio = pesoPromedio + 2
    }

    method pesoPromedio() = pesoPromedio
}


class PlagaPulgas inherits Plaga {
    method nivelDanio() = poblacion * 2
}


class PlagaGarrapatas inherits PlagaPulgas {
    override method atacar() {
        poblacion = poblacion * 1.2
    }
}


class PlagaMosquitos inherits Plaga {
    method nivelDanio() = poblacion

    override method puedeTransmitir() {
        return super() && poblacion % 3 == 0
    }
}