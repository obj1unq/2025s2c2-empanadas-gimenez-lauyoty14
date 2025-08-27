object galvan {
  var sueldo = 15000
  var dinero = 0
  var deuda = 0

  method sueldo() = sueldo
  method dinero() = dinero
  method deuda() = deuda 

  method sueldo(cantidad) {
    sueldo = cantidad
  }

  method gastar(cuanto) {
    if (cuanto > dinero) {
        deuda = deuda + (cuanto - dinero)
        dinero = 0
    } else {
        dinero = dinero - cuanto
    }
  }

  method cobrarSueldo() {
    if (deuda > sueldo) {
        deuda = deuda - sueldo
        gimenez.descontarSueldo(sueldo)
    } else {
        dinero = sueldo - deuda
        gimenez.descontarSueldo(sueldo)
        deuda = 0
    }
  }
}

object baigorria {
  var empanadasVendidas = 0
  var sueldoPorEmpanada = 15
  var dinero = 0
  var totalCobrado = 0

  method sueldo() = empanadasVendidas * sueldoPorEmpanada
  method totalCobrado() = totalCobrado

  method sueldoPorEmpanada(cantidad) {
    sueldoPorEmpanada = cantidad
  }

  method vender(cantidad) {
    empanadasVendidas = empanadasVendidas + cantidad
  }

  method cobrarSueldo(){
    dinero = dinero + self.sueldo()
    gimenez.descontarSueldo(self.sueldo())
    totalCobrado = totalCobrado + self.sueldo()
    empanadasVendidas = 0
  }
}

object gimenez {
    var fondo = 300000

    method fondo() = fondo 

    method pagarSueldo(empleado) {
      empleado.cobrarSueldo()
    }

    method descontarSueldo(cantidad) {
      fondo = fondo - cantidad
    }
}
