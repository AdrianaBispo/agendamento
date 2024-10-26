import 'package:flutter_modular/flutter_modular.dart';
//contoller
import 'presenter/editclient/view/client_edit_page.dart';
import 'presenter/newclient/controller/newclient_controller.dart';
//view
import 'presenter/home/view/client_view.dart';
import 'presenter/newclient/view/newclient_view.dart';

class ClientsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => NewClientController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ClientesPage()),
        ChildRoute('/newclient', child: (context, args) => const NewClient()),
        ChildRoute('/newclient',
            child: (context, args) => ClienteEditPage(cliente: args.data)),
      ];
}
