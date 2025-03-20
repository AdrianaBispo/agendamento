import 'package:flutter_modular/flutter_modular.dart';
//data
import 'data/repositories/client_repository_impl.dart';
import 'data/datasources/local/client_datasource_local_datasource_impl.dart';
//presenter
import 'presenter/editclient/controller/edit_client_controller.dart';
import 'presenter/home/controller/client_controller.dart';
import 'presenter/home/view/client_home_view.dart';
import 'presenter/newclient/controller/newclient_controller.dart';
import 'presenter/editclient/view/client_edit_view.dart';
import 'presenter/newclient/view/newclient_view.dart';

class ClientsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientLocalDataSourceImpl()),
        Bind((i) => ClientRepositoryImpl(i.get<ClientLocalDataSourceImpl>())),
        Bind((i) => ClientController(i.get<ClientRepositoryImpl>())),
        //NewClient
        Bind((i) => NewClientController(i.get<ClientRepositoryImpl>())),
        //EditClient
        Bind((i) => ClientEditController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => ClientHomeView()),
        ChildRoute('/newclient',
            child: (context, args) => const NewClientView()),
        ChildRoute('/editclient',
            child: (context, args) => ClienteEditView(cliente: args.data)),
      ];
}
