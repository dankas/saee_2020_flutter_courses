## Iterations
```dart
for (int i=0;i<5; i++) {
 print(i);
} // prints 0 to 4

var list = [1,2,3,4,5];
for (final i in list) {
 print(i);
} // prints 1 to 5
int i=0;
while (i < 5) {
 print(i);
 i++;
} // prints 0 to 4

i = 0;
do {
 print(i);
 i++;
} while (i<5);
// prints 0 to 4
```
## Class
```dart
class MyLocation {
}
// type inference
var loc1 = new MyLocation();
// declare and initialize
MyLocation loc2 = new MyLocation();
```
## Properties
```dart 
class MyLocation {
 // read/write properties
 var lat;
 var lng;

 // read-only property
 final arrived = false;
}
loc1.lat = 57.123;
loc1.lng = 37.22;
// loc1.arrived = true; // error
var arr = loc1.arrived;
```
## Methods
```dart
class MyLocation {
 // read/write properties
 var lat;
 var lng;
 // read-only property
 final arrived = false;
 void someMethod() {
 }
}
loc1.someMethod();
```
## Constructors
```dart
class MyLocation {
// read/write properties
 var lat;
 var lng;
 // read-only property
 final arrived = false;
 // unnamed constructor
 MyLocation() {
 this.lat = 0;
 this.lng = 0;
 }

 // named constructor
 MyLocation.withPosition(
 var lat, var lng) {
 this.lat = lat;
 this.lng = lng;
 }
 void someMethod() {
 }
}
var loc1 = new MyLocation();
 var loc2 = new
 MyLocation.withPosition(
 57.123,37.22);
 ```
## Getters and Setters
```dart
class MyLocation {
 double _lat;
 double _lng;
 double get lat => _lat;
 set lat (double value) {
 if (value > 90 || value < -90) {
 throw("Invalid latitude");
 }
 _lat = value;
 }

 double get lng => _lng;
 set lng (double value) {
 if (value > 180 ||
 value < -180) {
 throw("Invalid longitude");
 }
 _lng = value;
 }

 // read-only property
 final arrived = false;

 // unnamed constructor
 MyLocation() {
 this.lat = 0;
 this.lng = 0;
 }

 // named constructor
 MyLocation.withPosition(
 var lat, var lng) {
 this.lat = lat;
 this.lng = lng;
 }
 void someMethod() {
 }
}
 var loc1 = new MyLocation();
 var loc2 = new
 MyLocation.withPosition(
 57.123,37.22);
 loc1.lat = 57.123;
 loc1.lng = 37.22;

 loc2.lat = 999;
 // Uncaught exception:Invalid
 // latitude
 ```
## Inheritance
```dart
// abstract class cannot be
// instantiated directly
abstract class Shape {
 double length;
 double width;
 // without this zero-argument
 // constructor, class cannot be
 // extended
 Shape() {
 this.length = 0;
 this.width = 0;
 }

 // constructor with another name
 Shape.withDimension(double length,
 double width){
 this.length = length;
 this.width = width;
 }
 double perimeter() {
 return 2 * (this.length +
 this.width);
 }
 double area() {
 return this.length * this.width;
 }
}
class Rectangle extends Shape {
 Rectangle() {}
 Rectangle.withDimension(
 double length, double width):
 super.withDimension(
 length, width);
}
```
## Final Class
```dart
// Square cannot be extended (it
// does not have a zero-argument
// constructor)
class Square extends Rectangle {
 Square(double length):
 super.withDimension(
 length, length);
}

 Square s = new Square(5);
 print(s.area()); // 25
 print(s.perimeter()); // 20
 ```
## Overriding
```dart
class Circle extends Shape {
 Circle(double radius):
 super.withDimension(
 radius, radius);
 double area() {
 return 3.14 * this.length *
 this.length;
 }
 double perimeter() {
 return (2 * 3.14 * this.length);
 }
 // overloading of methods not
 // supported in Dart
}
 Circle c = new Circle(6);
 print(c.area());
 // 113.03999999999999

 print(c.perimeter()); // 37.68
 ```
## Static Members/Methods
```dart
class Car {
 static var MilesToKM = 1.60934;
 static double kilometersToMiles(
 double km) {
 return km / 1.60934;
 }
 void accelerate() {}
 void decelerate() {}
 void stop() {}
 void printSpeed() {}
}
```
## Interfaces
```dart
class CarInterface {
 void accelerate() {
 // default implementation
 ...
 }
 void decelerate() {}
 void accelerateBy(int amount) {}
}
class MyCar implements
 CarInterface {
 void accelerate() {
 }
 void decelerate() {
 }
 void accelerateBy(int amount) {
 }
}
```

### Referência
Rev	1.1.1 ©	Wei-Meng	Lee	,	Developer	Learning Solutions, http://calendar.learn2develop.net All	rights	reserved.