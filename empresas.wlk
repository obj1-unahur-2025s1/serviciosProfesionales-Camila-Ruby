import universidades.*
import profecionales.*
import solicitantes.*

class Empresa{
    var property honorariosDeReferencia
    const property profecionales = []
    const property clientes = #{}

    method contratarProfecional(unProfecional){ profecionales.add(unProfecional)}
    method cuantosEstudiaronEn(unaUniversidad)= profecionales.count({p => p.universidad() == unaUniversidad})
    method profecionalesCaros() = profecionales.filter({p => p.honorarios() > honorariosDeReferencia}).asSet()
    method universidadesFormadoras()= profecionales.map({p => p.universidad()}).asSet()
    method profecionalMasBarato() = profecionales.min({p => p.honorarios()}) 
    method esDeGenteAcotada() = profecionales.all({ p=> p.provinciasDondeTrabaja().size() <= 3 })
    method puedeSatisfacer(unSolicitante) = profecionales.any({p => unSolicitante.puedeSerAtendidoPor(p)})
    method darServicio(unSolicitante){
        if(self.puedeSatisfacer(unSolicitante)){
            const profecional = profecionales.find({p => unSolicitante.puedeSerAtendidoPor(p)})
            
            profecional.cobrar(profecional.honorarios())
            clientes.add(unSolicitante)
        }
    }
    method cantidadDeClientes() = clientes.size()
    method tieneComoClienteA(unSolicitante) = clientes.contains(unSolicitante)

    
    
    method esProfecionalPocoAtractivo(unProfecional){
        const profProv = unProfecional.provinciasDondeTrabaja().asSet()
        const profMismaProv = profecionales.filter({p => p.provinciasDondeTrabaja().asSet() == profProv})
        return profMismaProv.any({p => p.honorarios() < unProfecional.honorarios()})
    
    }


}