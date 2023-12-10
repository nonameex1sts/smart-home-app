import 'package:SmartHome/src/screens/edit_device/components/body.dart';
import 'package:flutter/material.dart';

class EditDevice extends StatelessWidget {
  final int id;
  final String type;
  final String description;
  const EditDevice({Key? key, required this.id, required this.type, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        body: Body(id: id, type: type, description: description),
      ),
    );
  }
}
