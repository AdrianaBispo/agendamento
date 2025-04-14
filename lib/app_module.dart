import 'package:flutter_modular/flutter_modular.dart';
//view
import '../modules/start/presenter/view/start_page.dart';
//controller
import '../modules/start/presenter/controller/start_controller.dart';
//module
import 'package:agenda/modules/clients/clients_module.dart';
import 'package:agenda/modules/professional/professional_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<StartController>(StartController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const StartPage(),
      children: [
       ModuleRoute('/professionals/', module: ProfessionalModule()),
        ModuleRoute('/clients/', module: ClientsModule()),
      ],
    );
  }
}
