import 'dart:math';

import 'package:darwin_example/models/cat.dart';
import 'package:darwin_sdk/darwin_sdk.dart';

@Service()
class CatService {

  List<Cat> cats = [
    Cat("Whiskers", 5),
    Cat("Felix", 3),
    Cat("Oscar", 4),
    Cat("Neko", 2)
  ];

  bool hasCat(String name) => cats.any((element) => element.name == name);

  Cat getRandomCat() {
    var random = Random();
    var index = random.nextInt(cats.length);
    return cats[index];
  }

  Cat getNamedCat(String name) {
    return cats.firstWhere((element) => element.name == name);
  }

  List<Cat> getAllCats() {
    return cats;
  }

  Cat addCat(Cat cat) {
    cats.add(cat);
    return cat;
  }

  void removeCat(String name) => cats.removeWhere((element) => element.name == name);

  void putCat(Cat cat) {
    removeCat(cat.name);
    addCat(cat);
  }

}