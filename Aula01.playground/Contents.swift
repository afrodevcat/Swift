//Xcode Playground: REPL (Read Eval Process Loop)

//===============================================================
//## COMENTÁRIOS

//Comentário de 1 linha: //
//Comentário de múltiplas linhas: /* ..... */

/*

 //var name: String = "Eric"

/*
func sayHello(to name: String) {
    print("Olá \(name)")
}
*/

struct Person {
    var name: String
    var age: Int
}

*/

import Foundation
//Command + Option + /
//Windows + Alt + / (Windows)

/// Método para realizar uma requisição HTTP
/// - Parameters:
///   - url: URL contendo o endereço da API a ser chamada
///   - method: Método HTTP a ser usado (ex.: GET, POST, DELETE, ..)
///   - parameters: Dicionário contendo a lista de parâmetros enviado no corpo da requisição
///   - header: Dicionário contendo a lista de parâmetros enviado no cabeçalho da requisição
/// - Returns: Void (não tem retorno)
func request(_ url: URL, method: String = "GET", parameters: [String: Any], header: [String: Any]) -> Void {
    
}


//===============================================================
//## Variáveis e Constantes

//Camel Case
var mySallary: Double = 245.0

//Linguagem fortemente tipada
mySallary = 300.0

//Inferência de Tipo
//var age = 42
var name = "Eric Brito"
var letterA: Character = "a"
var accountValue: Float = -1460.20
let isiOSTheBestOSEver = true

mySallary = 260.0
mySallary * 2

//Constante
let cpf = 640_099_712.90

//Tipos
//Int, Double, Float, String, Character, Bool
//UInt, Int8, Int16, Int32, Int64

var age: UInt8 = 42
UInt.max

//String
var numberA = 45
var numberB = 77
var sumAB = numberA + numberB

let firstName = "Eric"
let lastName = "Brito"

//let fullName = firstName + " " + lastName


//Interpolação de String
let sentence = "\(firstName) \(lastName) \" tem \(age) anos"

//Raw String
let rawString = """
                es;klfjslkfs   "   \(lastName)  lkshjfdjks
sd.mfsdnbjfdsnb
     d;lgjkdlkgjflkgd
"""
print(rawString)

//Eric Brito 42 anos

let 🐕 = "Melissa"
let 🐩 = "Leona"
let 🦮 = "Lola"
let 💩 = "cocô"

//Uso de emoji
let dogSentence = "\(🐕), \(🐩) e \(🦮) adoram fazer \(💩)"

