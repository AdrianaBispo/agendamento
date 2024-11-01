import 'package:flutter_modular/flutter_modular.dart';
//contoller
import 'presenter/editclient/controller/edit_client_controller.dart';
import 'presenter/editclient/view/client_edit_page.dart';
import 'presenter/home/controller/client_controller.dart';
import 'presenter/newclient/controller/newclient_controller.dart';
//view
import 'presenter/home/view/client_home_view.dart';
import 'presenter/newclient/view/newclient_view.dart';

class ClientsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => ClientController()),
        Bind.singleton((i) => NewClientController()),
        Bind.singleton((i) => ClientEditController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ClientHomeView()),
        ChildRoute('/newclient', child: (context, args) => const NewClientView()),
        ChildRoute('/editclient',
            child: (context, args) => ClienteEditPage(cliente: args.data)),
      ];
}
