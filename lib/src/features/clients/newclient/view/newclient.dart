import 'package:flutter/material.dart';
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
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.close,
            color: AppColor.instance.natural_2,
          ),
        ),
        backgroundColor: AppColor.instance.stronk,
        elevation: 0,
      ),
      body: FormClient(),
    );
  }
}
