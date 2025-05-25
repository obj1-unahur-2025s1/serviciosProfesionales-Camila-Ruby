import profecionales.*
import universidades.*
import empresas.*

class Persona{
    const property provincia

    method puedeSerAtendidoPor(unProfecional) = unProfecional.provinciasDondeTrabaja().contains(provincia)
}

class Institucion{
    const property listaUniversidades

    method agregarUniversidad(unaUniversidad){listaUniversidades.add(unaUniversidad)}
    method puedeSerAtendidoPor(unProfecional) = listaUniversidades.contains(unProfecional.universidad())
}

class Club{
   const property provincias

   method agregarProvincia(unaProvincia){provincias.add(unaProvincia)}
   method puedeSerAtendidoPor(unProfecional) = !provincias.asSet().intersection(unProfecional.provinciasDondeTrabaja().asSet()).isEmpty()
}