//Tupla

//let address = "Rua Inglês de Souza, número 268, 01546-010"
let address: (street: String, number: Int, zipCode: String) = ("Rua Inglês de Souza", 268, "01546-010")

print("O meu CEP é \(address.street)")

//Decomposição de Tupla
//let street = address.street
//let number = address.number
//let zipcode = address.zipCode

let (rua, _, _) = address

print("Moro na rua \(rua)")


//=======================
//Optional


var driverLicense: String = ""

var sallary: Double? = 800

//print("O meu salário é \(sallary)")

//Desembrulhar o Optional
//Optional binding

if let sallary = sallary {
    print("O meu salário é \(sallary)")
}

//Nil Coalescing Operator
//Operador de coalescência Nula

var number1: Int? = Int("3ee")
var number2: Int? = Int("125r")
var number3: Int? = Int("200z")

let number = number1 ?? number2 ?? number3 ?? 0


func doNothing() {
    
    /*
    if let sallary = sallary {
        print("O meu salário é: \(sallary)")
    } else {
        print("Esse carinha não tem salário")
    }
    */
    
    guard let sallary = sallary else {
        print("Esse carinha não tem salário")
        return
    }
    
    print("O meu salário é: \(sallary)")
    print("O meu salário vezes 2 é \(sallary * 2)")
    
    
}
doNothing()


//Implicitly Unwrapped Optional
//Optional impliscitamente desembrulhado

var heir: String?

//heir = "Eric"

//Optional Chaining
print("O meu herdeiro é \(heir?.uppercased())")


//GEITO VIDA LOKA
//print("O herdeiro é \(heir!)")


let superDaiana = "DaianA".lowercased()

//Operador
//+, -, *, /, %, >, <, >=, <=, !, &&, ||, =, ==, ===
var isMale: Bool = true
let varFalse = !isMale
isMale


//Closed Range: ...
//Half-Open Range: ..<
//Operador ternário
let grade = 9.0
var status = grade >= 7.0 ? "Aprovado" : "Reprovado"



//Controle de fluxo
// IF -> ELSE -> IF ELSE

var averageGrade = 8.5
var finalStatus: String = ""
if averageGrade > 7.0 {
    finalStatus = "Aprovado"
} else {
    finalStatus = "Reprovado"
}

let letter = "u"
if letter == "a" {
    print("É vogal")
} else if letter == "e" {
    print("É vogal")
} else if letter == "i" {
    print("É vogal")
} else if letter == "o" {
    print("É vogal")
} else if letter == "u" {
    print("É vogal")
} else {
    print("É consoante")
}

if letter == "a" || letter == "b" || letter == "c" || letter == "d" || letter == "e" {
    print("É vogal")
} else {
    print("É consoante")
}

//Switch
//Switch, em swift, precisa ser exaurido (exhaustive)
switch letter {
case "a", "e", "i", "o", "u":
    print("É vogal")
default:
    print("É consoante")
}


switch letter {
case "a"..."n":
    print("Primeira metade")
default:
    print("Segunda metade")
}

let speed = -20.0
switch speed {
case ..<20.0:
    print("Primeira marcha")
case 20.0..<40.0:
    print("Segunda marcha")
default:
    print("Outra marcha")
}


let location = (x: 3, y: 5, z: 8)

switch location {
case (0, 0, 0):
    print("Está na origem")
case (_, 0, 0):
    print("Está no eixo X")
case (0, let y, 0):
    print("Está no eixo Y, na posição \(y)")
case let (x, y, _) where x == y:
    print("Estou no eixo Z e na mesma posição de X e Y que é \(x)")
default:
    print("Estou em algum outro lugar")
}


//Laços
//While, Repeat While

var life = 7
while life > 0 {
    print("Estou vivo")
    life -= 1
}

//++, --
//for (var i = 0, i < 100, i++) {
//}

//for in
let names = ["Diane", "Wesley", "Guilherme", "Thiago", "Talita", "Daiana", "Jonas"]
for name in names {
    print(name.uppercased())
}

for number in 1...100 {
    number
}

for number in stride(from: 0, to: 100, by: 5) {
    number
}

for name in names.reversed() {
    print(name)
}


//Coleções
//Array
//Coleções ordenadas de valores de mesmo tipo
let array: [Int] = [10, 12, 27, 40, 51]
var newNames: [String] = ["José", "Paulo", "Carol", "Billy", "Bia"]
var emptyArray: [Double] = []
var emptyArray2 = [Double]()
var emptyArray3 = Array<String>()

//Total de elementos
newNames.count

//Verificando se está vazio
newNames.isEmpty

//Acessando um valor de um Array
print(newNames[0])
print(emptyArray.first ?? "Não tem primeiro elemento")

//Adiconando
newNames.append("Karla")
newNames.insert("Joaquim", at: 1)
newNames += ["Álvaro", "Zeca"]
newNames.contains("Bia")
if let biaIndex = newNames.firstIndex(of: "Maria") {
    print("A Maria se encontra no índice \(biaIndex)")
} else {
    print("Maria não está nesse array")
}

//Removendo elementos
newNames.remove(at: 3)
newNames.removeLast(2)
//newNames.removeAll()

newNames.randomElement()
