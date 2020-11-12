//Coleções
//Arrays

//Dicionários (Dictionaries)
//É uma coleção, não ordenada, de elementos de mesmo tipo, acessados por uma chave

var states: [String: String] = [
            "BA": "Bahia",
            "SP": "São Paulo",
            "RJ": "Rio de Janeiro",
            "MG": "Minas Gerais",
            "PA": "Pará"
            ]

var months: [Int: String] = [1: "Janeiro", 2: "Fevereiro", 3: "Março"]

var emptyDictionary: [String: Int] = [:]
var emptyDictionary2 = [String: Int]()
var emptyDictionary3 = Dictionary<String, Int>()

//Total de elementos
states.count
states.isEmpty

//Acessando elementos
if let pa = states["ZZ"] {
    print("Eu nasci no estado do \(pa)")
} else {
    print("Eu não nasci no estado do Pará")
}

//Adicionando
states["MA"] = "Maranhão"
states.count

//Removendo elementos de um dicionário
states["PA"] = nil

for (stateAcronym, stateName) in states {
    print("O estado cuja sigla é \(stateAcronym) é o \(stateName)")
}

//Set
//Coleção, não ordenada, de valores de mesmo tipo que NÃO SE REPETEM

var movies: Set<String> = ["Matrix", "Vingadores", "Jurassic Park", "De Volta para o Futuro"]
var myWifeMovies: Set<String> = ["De Repente 30", "Mensagem para Você", "Jurassic Park", "De Volta para o Futuro"]

//Total
movies.count
movies.isEmpty

//Verificando a existência de um elementos
movies.contains("Matrix")

//Adicionando elementos
//let result = movies.insert("Homem-Aranha")
if movies.insert("Homem-Aranha").inserted {
    print("Adicionei o filme do Homem-Aranha")
} else {
    print("O filme do Homem-Aranha já estava na lista")
}

//Removendo
movies.remove("Homem-Aranha")

let coupleMovie = movies.union(myWifeMovies)
let favoriteCoupleMovies = movies.intersection(myWifeMovies)
let newFavoriteMovies = movies.subtracting(myWifeMovies)


//Enumeradores
enum Seat {
    case aisle
    case middle
    case window
}

enum Compass {
    case north, south, east, west
}

var seat: Seat = .middle
var heading: Compass = .north

print("Estou indo para o \(heading)")

switch heading {
case .north:
    print("Estou indo para o Norte")
case .south:
    print("Estou indo para o Sul")
case .east:
    print("Estou indo para o Leste")
case .west:
    print("Estou indo para o Oeste")
}

switch heading {
case .north, .south:
    print("Estou viajando no eixo Y")
case .east, .west:
    print("Estou viajando no eixo X")
}

//Valores padrões
enum WeekDay: String {
    case sunday = "Domingo"
    case monday = "Segunda-feira"
    case tuesday
    case wednesday
    case thursday = "Quinta-feira"
    case friday
    case saturday
}

let weekDay = WeekDay.thursday
print("Hoje é \(weekDay.rawValue)")
let sunday = WeekDay(rawValue: "Domingo")


//Valores Associados
enum Month: Int {
    case january = 1
    case may = 5
    case june
    case july
    case august
    case september
    case october
    case november
    case december
}

let month: Month = .december
print(month.rawValue)


//Valores associados
enum Measure {
    case age(Int)
    case weight(Double)
    case size(Double, Double)
}

let measure: Measure = .size(45, 25)

switch measure {
case .age(let age):
    print("Esta é uma medida de idade e a idade é \(age) anos")
case .weight(let weight):
    print("Esta é uma medida de peso e o peso é \(weight)Kg")
case .size(let width, let height):
    print("Esta é uma medida de tamanho, a altura é \(height)cm e a largura é \(width)cm")
}

if case .age(let age) = measure {
    print("A minha altura é \(age)")
}

enum PizzaFlavour: String {
    case marguerita, mozarella, chocolate, bacon, atum
}

let pizzaFlavourText: String = "atum"

if let pizzaFlavour = PizzaFlavour(rawValue: pizzaFlavourText) {
    print("O seu pedido de \(pizzaFlavour.rawValue) está sendo processado")
} else {
    print("Infelizmente não temos esse tipo de pizza!")
}


//Classes e Estruturas (Class vs Struct)

//Class
class Person {
    var name: String
    var age: Int
    var gender: Character
    
    init(name: String, age: Int, gender: Character) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
    init(name: String, gender: Character) {
        self.name = name
        self.gender = gender
        age = 0
    }
}

var eric = Person(name: "Eric", age: 42, gender: "M")
var babyEric = Person(name: "Eric Bebê", gender: "M")


//Structs
struct Citizen {
    var name: String
    var age: Int
    var gender: Character
}

//Memberwise Initializer
let citizen = Citizen(name: "Cidadão", age: 33, gender: "M")

//Classes são "Reference Type", e as Structs são "Value Type"
//Classes são passadas por referência e structs são passadas por cópia

let person1 = Person(name: "Paula", age: 27, gender: "F")
let person2 = person1
print("Person1:", person1.name)
print("Person2:", person2.name)
person1.name = "Paulete"
print("Person1:", person1.name)
print("Person2:", person2.name)


if person1 === person2 {
    print("Apontam para o mesmo lugar de memória")
}


var citizen1 = Citizen(name: "Joaquim", age: 47, gender:  "M")
var citizen2 = citizen1
print("Citizen1:", citizen1.name)
print("Citizen2:", citizen2.name)
citizen1.name = "Juvenal"
print("Citizen1:", citizen1.name)
print("Citizen2:", citizen2.name)


let names = ["X", "Y", "Z"]
var names2 = names

names2.append("F")
//Copy-On-Write


var name1 = "Eric"
var name2 = name1

name1 = "Fátima"
name2 = "Fátima"
print(name1, name2)


if name1 == name2 {
    print("Nomes iguais")
}


//ARC: Automatic Reference Count
