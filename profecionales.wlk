import universidades.*

class ProfecionalVinculado {
    const property universidad

    method honorarios() = universidad.honorariosRecomendados()
    method provinciasDondeTrabaja() = [universidad.provincia()]
    method cobrar(unImporte){universidad.recibirDorancion(unImporte * 0.5)}
}

class ProfecionalAsociado{
    var property universidad

    method honorarios() = 3000 
    method provinciasDondeTrabaja() = ["Entre Rios", "Santa Fe", "Corrientes"]
    method cobrar(unImporte){asociacionPdelLitoral.recibir(unImporte)}
}
//Asociacion de Profecionales del Litoral
object asociacionPdelLitoral {
    var totalRecaudado = 0

    method recibir(unImporte){totalRecaudado += unImporte}
    method totalRecaudado() = totalRecaudado
}

class ProfecionalLibre{
    var property universidad
    const property provinciasDondeTrabaja = [] 
    var property honorarios
    var totalRecaudado = 0

    method agregarProvincia(unaProvincia) = provinciasDondeTrabaja.add(unaProvincia)
    method cobrar(unImporte) {totalRecaudado += unImporte}
    method pasarDinero(unProfecional, unImporte){
        if(unImporte <= totalRecaudado){
        unProfecional.cobrar(unImporte)
        totalRecaudado -= unImporte
        }
    }
    method totalRecaudado() = totalRecaudado
}