import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
//componentes
import '../../../components/custom_appbar.dart';
import '../../cliente_hive/client_adapter.dart';
import '../../cliente_hive/cliente_hive.dart';
import '../components/button_newclient.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({Key? key}) : super(key: key);

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  List<Map<String, dynamic>> _items = [];

  //final _shopItem = Hive.openBox('cliente');
 //IClienteAdapter clienteadapter = Modular.get();
 /*ClienteHive clienteHive = Modular.get();*/
   
 

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

                      const ButtonNewClient(),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) => Text(/*clienteadapter.get(index).toString()*/ ''),
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
