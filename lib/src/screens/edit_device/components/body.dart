import 'package:SmartHome/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  final String id;
  final String type;
  final String description;
  const Body({Key? key, required this.id, required this.type, required this.description}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController(text: widget.description);
  }

  @override
  Widget build(BuildContext context) {
    Future<bool?> showDeleteWarning() async {
      return showDialog<bool>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete device', style: TextStyle(color: Colors.red, fontSize: 24), textAlign: TextAlign.center,),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  SizedBox(height: 10),
                  Text('Are you sure?', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
                ],
              ),
            ),
            actions: <Widget>[
                TextButton(
                  child: const Text('No', style: TextStyle(color: Colors.grey, fontSize: 20)),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
                const SizedBox(width: 150),
                TextButton(
                  child: const Text('Yes', style: TextStyle(color: Colors.red, fontSize: 20)),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
        right: getProportionateScreenWidth(20),
        bottom: getProportionateScreenHeight(15),
      ),
      child: ListView(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7, right: 7),
            child: Row(
              children: [
                const Text(
                  'Edit Device',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autofocus: false,
                  textCapitalization: TextCapitalization.words,
                  initialValue: widget.id,
                  readOnly: true,
                  cursorColor: Colors.black12,
                  decoration: InputDecoration(
                    icon: Container(
                      height: 50,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.dnd_forwardslash,
                        color: Colors.white,
                      ),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    enabled: true,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  initialValue: widget.type,
                  readOnly: true,
                  cursorColor: Colors.black12,
                  decoration: InputDecoration(
                    icon: Container(
                      height: 50,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.dnd_forwardslash,
                        color: Colors.white,
                      ),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    enabled: true,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: descriptionController,
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if(value!.isEmpty || value.trim().isEmpty){
                      return 'Description is required';
                    }
                    return null;
                  },
                  cursorColor: Colors.black12,
                  decoration: InputDecoration(
                    icon: Container(
                      height: 50,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabled: true,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Container(
            height: getProportionateScreenHeight(40),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () async {
                if(_formKey.currentState!.validate()){
                  var url = Uri.http('localhost:3000', 'products');
                  var response = await http.put(url, body: {
                    'id': widget.id,
                    'description': descriptionController.text,
                  });

                  Navigator.pop(context, descriptionController.text);
                }},
              child: const Center(
                  child: Text('Save Changes', style: TextStyle(fontSize: 18, color: Colors.white70, fontWeight: FontWeight.bold),)
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Container(
            height: getProportionateScreenHeight(40),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () async {
                bool? delete = await showDeleteWarning();

                if(delete != null) {
                  if(delete){
                    if(_formKey.currentState!.validate()){
                      var url = Uri.http('localhost:3000', 'products');
                      var response = await http.delete(url, body: {
                        'id': widget.id,
                      });
                    };

                    Navigator.pop(context, 'delete');
                  }
                }
              },
              child: const Center(
                  child: Text('Delete device', style: TextStyle(fontSize: 18, color: Colors.white70, fontWeight: FontWeight.bold),)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
