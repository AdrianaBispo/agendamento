import 'package:flutter_modular/flutter_modular.dart';
//contoller
import 'home/store/clientehome_store.dart';
import 'newclient/controller/newclient_controller.dart';
//view
import 'home/view/home.dart';
import 'newclient/view/newclient.dart';

class ClientsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => ClienteHomeController()),
        Bind.singleton((i) => NewClientController())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => ClientesPage()),
        ChildRoute('/newclient', child: (context, args) => NewClient()),
      ];
}
