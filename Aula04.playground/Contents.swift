import Foundation

//ARC: Automatic Reference Count

//Reference count

class Person {
    var name: String
    var age: Int
    weak var friend: Person?
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        print("\(name) foi instanciado")
    }
    
    deinit {
        print("\(name) saiu da memória")
    }
}

/*
var person1: Person? = Person(name: "Zeca", age: 22)
var person2: Person? = person1
//2
person1 = nil
person2 = nil
*/

var person1: Person? = Person(name: "Felipe", age: 27)
var person2: Person? = Person(name: "Henrique", age: 44)

person1?.friend = person2
person2?.friend = person1

person1 = nil
person2 = nil


//Funções
func doNothing() {
    //Código nenhum
}
doNothing()

func say(sentence: String) {
    print(sentence)
}
say(sentence: "Hello World!")

func say(_ sentence: String, to person: String) -> Void {
    print("\(sentence) \(person)")
}
say("Olá", to: "Carol")

//Diga Olá para Carol


func sumValues(_ a: Int, _ b: Int) -> Int {
    return a+b
}

print(sumValues(25, 12))


func sum(initialValue: Int, with values: Int...) -> Int {
    var result = initialValue
    for value in values {
        result += value
    }
    return result
}

sum(initialValue: 12, with: 7, 5, 8, 9, 33)

//First Class Citizen (Cidadão de primeira classe)
func sum(a: Int, b: Int) -> Int {
    return a + b
}
func subtract(a: Int, b: Int) -> Int {
    return a - b
}
func multiply(a: Int, b: Int) -> Int {
    return a * b
}
func divide(a: Int, b: Int) -> Int {
    return a / b
}

typealias Operation = (Int, Int) -> Int

func calculate(x: Int, y: Int, operation: Operation) -> Int {
    return operation(x, y)
}

calculate(x: 10, y: 5, operation: multiply)


func brabuletaAzul(named: String) -> Operation {
    switch named {
    case "soma":
        return sum
    case "subtração":
        return subtract
    case "divisão":
        return divide
    default:
        return multiply
    }
}

let myFunction = brabuletaAzul(named: "soma")
myFunction(7, 5)

brabuletaAzul(named: "divisão")(12, 6)


func applySELIC(value: Double) -> Double {
    return 0
}
func applySavings(value: Double) -> Double {
    return 0
}
func applyCDB(value: Double) -> Double {
    return 0
}

func getApplicationNamed(_ name: String) -> (Double) -> Double {
    switch name {
    case "SELIC":
        return applySELIC
    case "POUPANÇA":
        return applySavings
    default:
        return applyCDB
    }
}

let application = getApplicationNamed("SELIC")
application(100)


//Closure: São funções anônimas
/*
func nomeDaFuncao(param: Tipo) -> TipoRetorno {
 //
 //
 //
 return tipoRetorno
}
 

{ (param: Tipo) -> TipoRetorno in
  //
  //
  //
  return tipoRetorno
}
 
*/


func modulus(a: Int, b: Int) -> Int {
    return a % b
}


calculate(x: 20, y: 7, operation: {(z: Int, w: Int) -> Int in
    return z % w
})

calculate(x: 20, y: 7, operation: {(z, w) -> Int in
    return z % w
})

calculate(x: 20, y: 7, operation: {(z, w) -> Int in
    return z % w
})

calculate(x: 20, y: 7, operation: {
    return $0 % $1
})

calculate(x: 20, y: 7, operation: {
    $0 % $1
})

calculate(x: 20, y: 7, operation: {$0 % $1})

//Trailing Closure
calculate(x: 20, y: 7){$0 % $1}

//High Order Functions


var names: [String] = ["Paula", "Joaquim", "Ana", "Zé", "Wladimir", "Bia"]

var uppercasedNames = [String]()
for name in names {
    uppercasedNames.append(name.uppercased())
}

var uppercasedNames2 = names.map{$0.uppercased()}
uppercasedNames2

var totalLetters = names.map{$0.count > 7}

var uppercasedNames3 = names.map{$0 == "Paula" ? $0.uppercased() : $0}
uppercasedNames3


var sixLettersNames = names.filter{$0.count > 5}
sixLettersNames


var totalLettersFinal = names.reduce(0, {$0 + $1.count})
totalLettersFinal

var totalLettersDash = names.reduce("", {$0 + $1 + "-"})
totalLettersDash


let sortedNames = names.sorted(by: >)
sortedNames


"7" < "6"


calculate(x: 20, y: 7, operation: %)


var numbers = [10, 15, 12, 0, 45, 70, 90, 6]

numbers.removeAll{$0 > 20}
numbers

if 9 > 6 {
    
}
if 9 == 6 {
    
}

//=========================================
