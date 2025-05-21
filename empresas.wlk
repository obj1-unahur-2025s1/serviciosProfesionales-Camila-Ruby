import universidades.*
import profecionales.*

class Empresa{
    var property honorariosDeReferencia
    const property profecionales = []
    method contratarProfecional(unProfecional){ profecionales.add(unProfecional)}
    method cuantosEstudiaronEn(unaUniversidad)= profecionales.count({p => p.universidad() == unaUniversidad})
    method profecionalesCaros() = profecionales.filter({p => p.honoradios() > honorariosDeReferencia}).asSet()
    method universidadesFormadoras()= profecionales.map({p => p.universidad()}).asSet()
    method profecionalMasBarato() = profecionales.min({p => p.honorarios()}) 
    method esDeGenteAcotada() = profecionales.all({ p=> p.provinciasDondeTrabaja().size() <= 3 })
}