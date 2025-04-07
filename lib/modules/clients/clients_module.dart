import 'package:flutter_modular/flutter_modular.dart';
//data
import 'data/repositories/client_repository_impl.dart';
import 'data/datasources/local/client_datasource_local_datasource_impl.dart';
//presenter
import 'domain/repositories/client_repository.dart';
import 'presenter/editclient/controller/edit_client_controller.dart';
import 'presenter/home/controller/client_controller.dart';
import 'presenter/home/view/client_home_view.dart';
import 'presenter/newclient/controller/newclient_controller.dart';
import 'presenter/editclient/view/client_edit_view.dart';
import 'presenter/newclient/view/newclient_view.dart';

class ClientsModule extends Module {
  @override
  void binds(i) {
    i.add(ClientLocalDataSourceImpl.new);
    i.addSingleton<ClientRepository>(
        () => ClientRepositoryImpl(i.get<ClientLocalDataSourceImpl>()));
        
    i.add(() => ClientController(i.get<ClientRepositoryImpl>()));
    i.add(() => NewClientController(i.get<ClientRepositoryImpl>()));
    i.add(() => ClientEditController(i.get<ClientRepositoryImpl>()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => ClientHomeView());
    r.child('/newclient', child: (context) => NewClientView());
    r.child('/editclient',
        child: (context) => ClienteEditView(cliente: r.args.data));
  }
}
