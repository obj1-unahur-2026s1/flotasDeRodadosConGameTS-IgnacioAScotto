class Pedido {
  const distanciaARecorrer
  var tiempoMaximo
  const property cantidadDePasajeros
  const property coloresIncompatibles

  method velocidadRequerida() = distanciaARecorrer / tiempoMaximo
  method puedeSerSatisfechoConAuto(auto) {
    return(
      auto.velocidadMaxima() >= self.velocidadRequerida()+10 and
      auto.capacidad() >= cantidadDePasajeros and
      !coloresIncompatibles.contains(auto.color())
    )
  }

  method acelerar() {
    tiempoMaximo -= 1
  }

  method relajar() {
    tiempoMaximo += 1
  }
}