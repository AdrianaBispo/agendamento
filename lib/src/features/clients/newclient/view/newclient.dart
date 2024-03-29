import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
//components
import '../components/form_client.dart';
//utils
import '../../../../shared/utils/app_color.dart';

class NewClient extends StatefulWidget {
  const NewClient({Key? key}) : super(key: key);

  @override
  State<NewClient> createState() => _NewClientState();
}

class _NewClientState extends State<NewClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Modular.to.navigate('./'),
          icon: Icon(
            Icons.close,
            color: AppColor.instance.primary,
          ),
        ),
        backgroundColor: AppColor.instance.primaryBackground,
        elevation: 0,
      ),
      body: const FormClient(),
      
    );
  }
}
