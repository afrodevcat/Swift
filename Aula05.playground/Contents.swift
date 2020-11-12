import Foundation

//Generics
func swapInts(_ first: inout Int, _ second: inout Int) {
    let temporaryFirst = first
    first = second
    second = temporaryFirst
}
var number1 = 20
var number2 = 45
swapInts(&number1, &number2)

print("number1:", number1)
print("number2:", number2)

//number1 -> 45
//number2 -> 20

func swapValues<T>(_ first: inout T, _ second: inout T) {
    print(first is Double)
    let temporaryFirst = first
    first = second
    second = temporaryFirst
}

var double1 = 24.6
var double2 = 33.9

var string1 = "ABC"
var string2 = "XYZ"

var bool1 = true
var bool2 = false

swapValues(&double1, &double2)
swapValues(&string1, &string2)
swapValues(&bool1, &bool2)

//print(double1, double2)
//print(string1, string2)
//print(bool1, bool2)

func compareValues<T: Comparable>(_ first: T, _ second: T) {
    if first == second {
        print("São iguais")
    } else {
        print("São diferentes")
    }
}

struct Person {
    var name: String
}

var eric = Person(name: "Eric")
var billy = Person(name: "Billy")

compareValues("Raened", "raened")
//compareValues(eric, billy)



//## Tratamento de erro
enum LoginError: Error {
    case invalidUserName
    case invalidPassword
    case invalidData
}

func login(userName: String, password: String) throws -> Bool {
    let validUserName = "AfroDev"
    let validPassword = "123456"
    if userName != validUserName && password != validPassword {
        throw LoginError.invalidData
    }
    if userName != validUserName {
        throw LoginError.invalidUserName
    }
    if password != validPassword {
        throw LoginError.invalidPassword
    }
    return true
}

do {
    try login(userName: "AfroDev2", password: "1232456")
    print("Uhhullll")
} catch {
    switch error as? LoginError {
    case .invalidData:
        print("Dados inválidos")
    case .invalidPassword:
        print("Senha inválida!")
    case .invalidUserName:
        print("Usuário inválido!")
    case .none:
        print("Error não é um LoginError")
    }
}

if let _ = try? login(userName: "AfroDev2", password: "1232456") {
    print("SUCESSO!!!")
} else {
    print("ERROR!!!!")
}

do {
    try login(userName: "AfroDev2", password: "1232456")
    print("Uhhullll")
} catch LoginError.invalidData {
    ///
} catch LoginError.invalidPassword {
    //
} catch LoginError.invalidUserName {
    //
} catch {
    //error
}


//try! login(userName: "AfroDev2", password: "1232456")
//

//
//
//Classe e Estruturas
class Vehicle {
    
    //Propriedade armazenada (stored properties)
    //Propriedade de instância
    var speed: Double = 0 {
        //Observador de propriedade
        didSet {
            speed = min(maxSpeed, speed)
        }
    }
    var model: String
    
    //Propriedade computada
    var maxSpeed: Double {
        return 500
    }
    
    //Propriedade de classe
    static var speedUnit = "Km/h"
    
    init(model: String) {
        self.model = model
    }
    
    //Método de instância
    func descript() -> String {
        return "Veículo: \(model), velocidade: \(speed) \(Vehicle.speedUnit)"
    }
    
    //Método de classe
    class func alert() -> String {
        return "Se beber, não dirija!"
    }
}

var bmw = Vehicle(model: "BMW")
bmw.speed = 1380.0
print(bmw.descript())

Vehicle.speedUnit = "milhas/h"
var bike = Vehicle(model: "Kawasaki")
bike.speed = 180.0

print(bike.descript())
print(bmw.descript())
print("Todos os meus veículos usam a unidade \(Vehicle.speedUnit) de velocidade")


struct Temperature {
    var celsius: Double
    
    //Propriedades computadas (Computed properties)
    var fahrenheit: Double {
        get {
            return (celsius * 9/5) + 32
        }
        set {
            celsius = (newValue - 32)/1.8
        }
    }
}

var temperature = Temperature(celsius: 22.0)
print("A temperatura é \(temperature.celsius)o Celsius")
print("A temperatura é \(temperature.fahrenheit)o Fahrenheit")

temperature.celsius = 27
temperature.fahrenheit = 80

struct Employee {
    var vacationDays: Int = 30
    static let holidays: Set<String> = ["25/12", "01/01", "07/09"]
}

var fernanda = Employee()
var thiago = Employee()
var raissa = Employee()

fernanda.vacationDays = 15
raissa.vacationDays = 20

//Herança
class Car: Vehicle {
    var licensePlate: String
    
    init(licensePlate: String, model: String) {
        self.licensePlate = licensePlate
        super.init(model: model)
    }
    
    //Polimorfismo
    override func descript() -> String {
        //return "\(super.descript()), placa: \(licensePlate)"
        return "Carro: \(model), velocidade: \(speed) \(Vehicle.speedUnit), placa: \(licensePlate)"
    }
    
    override var maxSpeed: Double {
        return 220
    }
}

var ferrari = Car(licensePlate: "XPT-0987", model: "Ferrari Ninja")
ferrari.speed = 300
print(ferrari.descript())

//Extensões
var fulano = "Antonio Faria Reis Oliveira Duarte Enrico Vieira"

extension String {
    var initials: String {
        return self.components(separatedBy: " ").compactMap{$0.first?.description}.joined()
    }
}

print(fulano.initials)

//Protocols
protocol ACCapable {
    var hasAC: Bool {get set}
    func turnOn()
    func turnOff()
}


class Bike: Vehicle {
}

class Boat: Vehicle {
    
}

class Airplane: Vehicle, ACCapable {
    
    var hasAC: Bool = false
    
    func turnOn() {
        print("Ligando o ar-condicionado do avião")
    }
    
    func turnOff() {
        print("Desligando o ar-condicionado do avião")
    }
    
}

func letIn(vehicle: Vehicle) -> Bool {
    
    if let acCapableVehicle = vehicle as? ACCapable {
        acCapableVehicle.turnOn()
        return true
    } else {
        return false
    }
    
}

letIn(vehicle: Airplane(model: "assdfa"))


var fusca = Car(licensePlate: "XXX", model: "Fusca")
var city = Car(licensePlate: "XXX", model: "Fusca")

extension Car: Equatable {
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.licensePlate == rhs.licensePlate && lhs.model == rhs.model
    }
}

if fusca == city {
    print("São o mesmo carro")
} else {
    print("São carros diferentes")
}


//Operadores personalizados
//Unários, Binários, Ternários
//prefix, postfix
prefix operator >>>
prefix func >>>(rhs: Int) -> Int {
    return rhs * 3
}
>>>7

postfix operator <<<
postfix func <<<(rhs: Int) -> Int {
    return rhs / 3
}
9<<<

infix operator >-<
func >-<(total: Int, universe: Int) -> [Int] {
    var result: Set<Int> = []
    while result.count < total {
        result.insert(Int.random(in: 1...universe))
    }
    return result.sorted()
}

//15 -> 25
//5 -> 80
//6 -> 60

6 >-< 60
5 >-< 80
15 >-< 25

