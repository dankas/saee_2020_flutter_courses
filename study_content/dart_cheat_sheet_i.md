# Dart Cheat Sheet - Parte 1
### Guia
* [Introdução e Instalação](./../README.md)
* **Dart Cheat Sheet - Parte 1**
* [Dart Cheat Sheet - Parte 2](dart_cheat_sheet_ii.md)
--- ---
## 3.1. Variáveis
```dart
int n1 = 5; // explicitamente tipado para int

var n2 = 4; // tipo inferido para int
n2 = "abc"; // erro

var n3 = "Hello world"; // tipo inferido para String
n3 = 2; // erro

dynamic n4 = 4; // dynamic significa que
 // n4 pode armazenar qualquer tipo
n4 = "abc"; // ok

double n5; // n4 é null
```
## 3.2. Constantes
```dart
const pi = 3.14;
// const é usado
// para constante em tempo de compilação

final area = pi * 5*5;
// final só pode ter o valor
//  atribído uma vez
```
## 3.3. Expressões Condicionais
```dart
//operador ternário 
var nota = 6;
var passou = nota >= 6 ? "Sim": "Não";

//equivale a
var nota = 6;
if(nota >= 6) {
    passou = "Sim";
} else {
    passou = "Não";
}
```
```dart
//operador 
var entrada; // entrada é null
var idade = entrada ?? 0;
//significa se entrada for igual a null
//idade recebe 0; caso contrario, recebe entrada
print(idade); // 0
```
## 3.4. Funções
```dart
void fazAlgumaCoisa() {
    print("fazAlgumaCoisa()");
}

fazAlgumaCoisa(); // fazAlgumaCoisa()
```
```dart
int somaNumeros(num1, num2, num3) {
    return num1+num2+num3;
}

print(somaNumeros(1,2,3)); // 6
 ```
## 3.5. *Arrow Syntax*
```dart
void fazAlgumaOutraCoisa() {
    fazAlgumaCoisa();
}

// a função acima pode ser reescrita
//  com a arrow syntax
void fazAlgumaOutraCoisa() => fazAlgumaCoisa();
 ```
## 3.6. Parâmetros Posicionais Opcionais
```dart
int somaNumeros2(num1, [num2=0, num3=0]) {
    return num1+num2+num3;
}

print(somaNumeros2(1)); //1
print(somaNumeros2(1,2)); //3
print(somaNumeros2(1,2,3)); //6
 ```
## 3.7. Parâmetros Nomeados
```dart
int somaNumeros3({num1, num2, num3}) {
    return num1+num2+num3;
}

print(somaNumeros3(num1:1,num2:2,num3:3));
 ```
## 3.8. Parâmetros Nomeados Opcionais
```dart
int somaNumeros3(num1, {num2=0, num3=0}) {
    return num1+num2+num3;
}

print(somaNumeros3(1));
print(somaNumeros3(1,num3:2));
print(somaNumeros3(1,num2:5,num3:2));
```
## 3.9. *Parsing* 
```dart
var s1 = "123"; //parse é utilizado para 
var s2 = "12.56"; //converter variáveis 
var s3 = "12.a56"; //textuais em outros tipos
var s4 = "12.0";
print(num.parse(s1)); // 123
print(num.parse(s2)); // 12.56
print(num.parse(s3)); // FormatException: 12.a56
```
```dart
//usar tryParse retorna null
//caso a conversão seja inválida
print(num.tryParse(s3)); // null
```
## 3.10. Concatenação de *Strings*
```dart
var s1 = "Hello";
var s2 = "world";
var s3 = s1 + ", " + s2;
var s = "${s3}!";
print(s); // Hello, world!
print("Soma de 5 e 6 é ${5+6}");
// Soma de 5 e 6 é 11
```
## 3.11. *List* (Vetor)
```dart
// lista dinâmica
var lista = [1, 2, 3, 4, 5];
print(lista.length); // 5 (tamanho da lista)
print(lista[1]); // 2 

lista[4] *= 2;
print(lista[4]); // 10

lista.add(6); // adiciona 6 no final
print(lista); // [1, 2, 3, 4, 10, 6]

List lista2;
lista2 = lista; //listas funcionam por referência
lista2[1] = 9; //modificar o valor da lista2
//irá alterar na lista também
print(lista); // [1, 9, 3, 4, 10, 6]
print(lista2); // [1, 9, 3, 4, 10, 6]

//lista de tamanho fixo
var lista3 = List(3);
print(lista3); // [null, null, null]
lista3.add(5);
// Uncaught exception:
// Unsupported operation: add
```
## 3.12. *Map*

```dart
var detales = {
    "nome":"Sam",
    "idade": 40,
}; //salva dados por chave e valor
```
```dart
var dispositivos = Map();
var apple = ["iPhone", "iPad"];
var samsung = ["S10", "Note 10"];
dispositivos["Apple"] = apple;
dispositivos["Samsung"] = samsung;

for (var marca in dispositivos.keys) {
    print(marca);
    for (var dispositivo in dispositivos[marca]) {
        print(dispositivo);
    }
}
```
## 3.13. Funções *Lambda*
```dart
var numeros = List<int>.generate(10, (int i) => i);

print(numeros);
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

var impares = numeros.where((n) => n % 2 == 1)
    .toList();
print(impares); // [1, 3, 5, 7, 9]

var soma = numeros.reduce((s,n) => s + n);
print(soma); // 45

var precos = numeros.map((n) => "\$$n")
    .toList();
print(precos);
//[$0, $1, $2, $3, $4, $5, $6, $7, $8, $9]
```
```dart
var nomes = ["Jimmy","TIM","Kim"];
// ordenar alfabeticamente (sem case sensitive)
nomes.sort((a, b) =>
    a.toUpperCase().compareTo(b.toUpperCase()),
);
print(nomes);
// [Jimmy, Kim, TIM]

// ordenar por tamanho do nome
nomes.sort((a, b) => a.length > b.length ? 1 : -1);
print(nomes);
// [Kim, TIM, Jimmy]
```
## 3.14 Função de Ordem Superior
```dart
List ordena(List itens, bool Function(int, int) comparador) {
    for (var i = 0; i < itens.length; i++) {
        for (var j = i + 1; j < itens.length; j++) {
            if (!comparador(itens[i], itens[j])) {
                var t = itens[j];
                itens[j] = itens[i];
                itens[i] = t;
            }
        }
    }
    return itens;
}

var numeros = [5, 2, 6, 8, 7, 9, 4, 3, 1];

// ordena de forma crescente
var numerosOrdenados = ordena(numeros, (n1, n2) => n1 < n2);
print(numerosOrdenados); // [1, 2, 3, 4, 5, 6, 7, 8, 9]

// ordena de forma decrescente
numerosOrdenados = ordena(numeros, (n1, n2) => n1 > n2);
print(numerosOrdenados); // [9, 8, 7, 6, 5, 4, 3, 2, 1]
```
--- ---
### Referência
Rev	1.1.1 ©	Wei-Meng	Lee	,	Developer	Learning Solutions, http://calendar.learn2develop.net All	rights	reserved.
