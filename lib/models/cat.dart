import 'package:dogs_core/dogs_core.dart';

@Serializable()
class Cat with DogsMixin<Cat> {

  String name;
  int age;

  Cat(this.name, this.age);

}