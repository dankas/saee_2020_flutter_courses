# Dart Cheat Sheet - Parte 2
### Guia
* [Introdução e Instalação](./../README.md)
* [Dart Cheat Sheet - Parte 1](dart_cheat_sheet_i.md)
* **Dart Cheat Sheet - Parte 2**
--- ---
## 3.15. Iteracões
```dart
for (int index = 0; index < 5; index++) {
    print(i);
} //  0 1 2 3 4

var lista = [1, 2, 3, 4, 5];
for (final elemento in lista) {
    print(elemento);
} // 0 1 2 3 4 5
```
```dart
int index = 0;
while (index < 5) {
    print(index);
    index++;
} // 0 1 2 3 4

index = 0;
do {
    print(index);
    index++;
} while (index < 5);
// 0 1 2 3 4
```
## 3.16. Classes
```dart
class Localizacao {
}

//formas de inicializar
var loc1 =  Localizacao();
Localizacao loc2 = Localizacao();
```
## 3.17. Propriedades
```dart 
class Localizacao {
    // propridedades de leitura/escrita
    double latitude;
    double longitude;

    // propridedade de apenas leitura
    final bool chegou = false;
}

loc1.latitude = 57.123;
loc1.longitude = 37.22;
loc1.arrived = true; // erro
```
## 3.18. Métodos
```dart
class Localizacao {
    double latitude;
    double longitude;
    final bool chegou = false;

    // metodos
    void mostraPosicao() {
        print("$latitude $longitude");
    }
}

loc1.mostraPosicao(); // 57.123 37.22
```
## 3.19. Construtores
```dart
class Localizacao {
    double latitude;
    double longitude;
    final bool chegou = false;

    // construtor não nomeado
    Localizacao() {
        this.latitude = 0;
        this.longitude = 0;
    }
    // construtor nomeado
    Localizacao.comPosicao(double latitude, double longitude) {
        this.latitude = latitude;
        this.longitude = longitude;
    }

    void mostraPosicao() {
        print("$latitude $longitude");
    }
}

var loc1 = Localizacao();
var loc2 = Localizacao.comPosicao(57.123,37.22);
 ```
## 3.20. *Getters* e *Setters*
```dart
class Localizacao {
    double _latitude;
    double _longitude;
    final bool chegou = false;

    double get latitude => _latitude;
    double get longitude => _longitude;

    set latitude (double valor) {
        if (valor > 90 || valor < -90) 
            throw("Latitude inválida");

        _latitude = valor;
    }
    set longitude (double valor) {
        if (valor > 180 || valor < -180) 
             throw("Longitude inválida");

        _longitude = valor;
    }

    Localizacao() {
        this.latitude = 0;
        this.longitude = 0;
    }

    Localizacao.comPosicao(double latitude, double longitude) {
        this.latitude = latitude;
        this.longitude = longitude;
    }

    void mostraPosicao() {
        print("$latitude $longitude");
    }
}
 var loc1 = Localizacao();
 var loc2 = Localizacao.comPosicao(57.123, 37.22);
 loc1.latitude = 57.123;
 loc1.longitude = 37.22;

 loc2.latitude = 999;
 // Uncaught exception:Posição Inválida
 ```
## 3.21. Herança
```dart
import "dart:math";

abstract class Forma {
    double altura;
    double largura;

    // sem este construtor de
    // zero argumentos, uma classe
    // não pode ser extendida
    Forma() {
        this.altura = 0;
        this.largura = 0;
    }

    // construtor com outro nome
    Forma.comDimensoes(double altura, double largura) {
        this.altura = altura;
        this.largura = largura;
    }

    double perimetro() => (this.altura + this.largura) * 2;
    double area() => this.altura * this.largura;
}

class Retangulo extends Forma {
    Retangulo.comDimensoes(double comprimento, double largura)
        : super.comDimensoes(comprimento, largura);
}

var forma1 = Retangulo.comDimensoes(2, 3); 
print(forma1.area()); // 6
print(forma1.perimetro()); //10

var forma2 = Forma.comDimensoes(1, 3); //erro
```

## 3.22. Sobrescrita
```dart
class Elipse extends Forma {
    Elipse.comDimensoes(double comprimento, double largura)
        : super.comDimensoes(comprimento, largura);

    @override
    double perimetro() => 2 * pi * sqrt((largura*largura + altura*altura)/2);

    @override
    double area() => this.altura * this.largura * pi;
}

var forma3 = Elipse.comDimensoes(2, 3);
print(forma3.area()); // 18.84955592153876
print(forma3.perimetro()); // 16.01904224441409
 ```
## 3.23. Membros/Métodos Estaticos 
```dart
class Carro {
    static double milhasParaKm(double milhas)
        => milhas / 1.60934;
    
    static double kmParaMilhas(double km)
        => km * 1.60934;
    
    void acelerar(){
        // implementação padrão
    }
    void frear();
    void parar();
    void mostraVelocidade();
}
```
## 3.24. Interfaces
```dart
class MeuCarro implements Carro {
    void acelerar() {
        // minha implementação
    }
    void frear() {
        // minha implementação
    }
    void parar() {
        // minha implementação
    }
}
```
--- ---
### Referência
Rev	1.1.1 ©	Wei-Meng	Lee	,	Developer	Learning Solutions, http://calendar.learn2develop.net All	rights	reserved.