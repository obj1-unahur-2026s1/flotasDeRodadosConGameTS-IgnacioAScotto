class Dependencia {
  const cantidadDeEmpleados
  const flotaDeRodados = []
  const registroDePedidos = []

  method agregarRodado(rodado) {
    flotaDeRodados.add(rodado)
  }
  method agregarRodados(listaDeRodados) {
    flotaDeRodados.addAll(listaDeRodados)
  }
  method quitarRodado(rodado) {
    flotaDeRodados.remove(rodado)
  }

  method pesoTotalFlota() = flotaDeRodados.sum({r => r.peso()})
  method estaBineEquipada() = flotaDeRodados.size() >= 3 and flotaDeRodados.all({r => r.velocidadMaxima() > 100}) 

  method rodadosDeColor(color) = flotaDeRodados.filter({r => r.color() == color}) 
  method capacidadTotalEnColor(color) = self.rodadosDeColor(color).sum({r => r.capacidad()}) 

  method colorDelRodadoMasRapido() = flotaDeRodados.max({r=>r.velocidadMaxima()}).color()

  method capacidadTotalDeFlota() = flotaDeRodados.sum({r=>r.capacidad()})
  method capacidadFaltante() = cantidadDeEmpleados - self.capacidadTotalDeFlota()

  method esGrande() = cantidadDeEmpleados >=40 and flotaDeRodados.size() >= 5

  //Pedidos
  method agregarPedido(pedido) {
    registroDePedidos.add(pedido)
  }
  method agregarPedidos(listaDePedidos) {
    registroDePedidos.addAll(listaDePedidos)
  }
  method quitarPedido(pedido) {
    registroDePedidos.remove(pedido)
  }

  method totalDePasajerosEnPedidos() = registroDePedidos.sum({p=>p.cantidadDePasajeros()}) 

  method pedidosQueNoPuedenSerSatisfechos() = registroDePedidos.filter({p=>self.pedidosQueNoPuedenSerSatisfechosPorNingunAuto(p)})
  method pedidosQueNoPuedenSerSatisfechosPorNingunAuto(p) = flotaDeRodados.all({r=>!p.puedeSerSatisfechoConAuto(r)})

  method todosLosPedidosTienenIncompatible(color) = registroDePedidos.all({p=>p.coloresIncompatibles().contains(color)})

  method relajarTodosLosPedidos() {
    registroDePedidos.forEach({p => p.relajar()})
  }
}