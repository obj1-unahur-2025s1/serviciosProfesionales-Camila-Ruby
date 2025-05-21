import universidades.*

class ProfecionalVinculado {
    const property universidad
    method honorarios() = universidad.honorariosRecomendados()
    method provinciasDondeTrabaja() = [universidad.provincia()]
}

class ProfecionalAsosciado{
    var property universidad
    method honorarios() = 3000 
    method provinciasDondeTrabaja() = ["Entre Rios", "Santa Fe", "Corrientes"]
}

class ProfecionalLibre{
    var property universidad
    const property provinciasDondeTrabaja = [] 
    var property honorarios
    method agregarProvincia(unaProvincia) = provinciasDondeTrabaja.add(unaProvincia)
}