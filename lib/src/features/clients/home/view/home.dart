import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../cliente_hive/client_adapter.dart';
import '../../cliente_hive/cliente_hive.dart';
//componentes
import '../../../components/button_new.dart';
import '../../../components/custom_appbar.dart';
class ClientesPage extends StatefulWidget {
  const ClientesPage({Key? key}) : super(key: key);

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
 
  //final _shopItem = Hive.openBox('cliente');
 //IClienteAdapter clienteadapter = Modular.get();
 ClienteHive clienteHive = Modular.get();
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: SizedBox(
                child: SingleChildScrollView( 
                  child: Column(
                    children: <Widget>[
                      const CustomAppBar(texto: 'Clientes'),

                      const ButtonNew(path: '/clients/newclient', text: 'Novo Cliente',),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) => Text(Modular.get<IClienteAdapter>().toString()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
