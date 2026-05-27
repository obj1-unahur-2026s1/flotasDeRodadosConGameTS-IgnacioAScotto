class ChevroletCorsa {
  const property color

  method capacidad() = 4
  method peso() = 1300
  method velocidadMaxima() = 150   
}

class RenaultKwid {
  const property tieneTanque

  method capacidad() = if(tieneTanque) 4 else 3
  method peso() = if(tieneTanque) 1350 else 1200
  method velocidadMaxima() = if(tieneTanque) 110 else 120
  method color() = azul 
}

object trafic {
  var interior = comodo
  var motor = pulenta

  method capacidad() = interior.capacidad()
  method peso() = 4000 + interior.peso() + motor.peso()
  method velocidadMaxima() = motor.velocidad()
  method color() = blanco  

  method cambiarInterior(nuevoInterior) {
    interior = nuevoInterior
  }

  method cambiarMotor(nuevoMotor) {
    motor = nuevoMotor
  }
}

class AutoEspecial {
  const property capacidad
  const property peso
  const property velocidadMaxima
  const property color  
}

//Variaciones de la trafic
object comodo {
    method capacidad() = 5
    method peso() = 700
}

object popular {
    method capacidad() = 12
    method peso() = 1000
}

object pulenta {
    method velocidad() = 130
    method peso() = 800 
}

object bataton {
    method velocidad() = 80
    method peso() = 500
}

//colores
object azul {}
object blanco {}
object rojo {}
object verde {}
object beige {}