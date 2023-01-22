import 'package:darwin_example/darwin.g.dart';
import 'package:darwin_example/dogs.g.dart';
import 'package:darwin_http/darwin_http.dart';
import 'package:darwin_marshal/darwin_marshal.dart';
import 'package:dogs_darwin/dogs_darwin.dart';
import 'package:logging/logging.dart';

Future main(List<String> arguments) async {
  await initialiseDogs();
  await initialiseDarwin();
  application.watchProcessSignals = true;
  application.setLogLevel(Level.ALL);
  application.install(HttpPlugin());
  application.install(MarshalPlugin((marshal) {
    DogsMarshal.link(marshal, dogs);
  }));
  await application.execute();
}
