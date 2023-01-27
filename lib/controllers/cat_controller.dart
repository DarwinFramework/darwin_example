import 'package:darwin_example/models/cat.dart';
import 'package:darwin_example/services/cat_service.dart';
import 'package:darwin_http/darwin_http.dart';
import 'package:darwin_sdk/darwin_sdk.dart';

@RestController()
@RequestMapping("/api/cats")
class CatController {
  CatService service;

  CatController(this.service);

  @GetMapping("{name}")
  Cat retrieveCat(@PathParameter() String name) {
    if (!service.hasCat(name)) throw RequestException.notFound();
    return service.getNamedCat(name);
  }

  @PostMapping()
  Cat createCat(@Body() Cat cat) => service.addCat(cat);

  @PutMapping("{name}")
  Cat saveCat(@PathParameter() String name, @Body() Cat cat) {
    service.removeCat(name);
    service.addCat(cat);
    return cat;
  }

  @DeleteMapping("{name}")
  void deleteCat(@PathParameter() String name) => service.removeCat(name);

  @GetMapping("random")
  Cat retrieveRandomCat() => service.getRandomCat();

  @GetMapping()
  List<Cat> retrieveAll() => service.getAllCats();
}
