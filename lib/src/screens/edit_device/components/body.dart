import 'package:SmartHome/config/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final int id;
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
                  initialValue: widget.id.toString(),
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
              onTap: () {},
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
              onTap: () {},
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
