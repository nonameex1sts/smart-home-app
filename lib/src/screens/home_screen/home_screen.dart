import 'package:domus/config/size_config.dart';
import 'package:domus/src/screens/edit_profile/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../set_event_screen/set_event_screen.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  String name;
  dynamic devices;

  HomeScreen({Key? key, required this.name, required this.devices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: getProportionateScreenHeight(60),
                  elevation: 0,
                  iconTheme: const IconThemeData(color: Colors.black),
                  title: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(
                        4,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                            color: Color(0xffdadada),
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(45, 45)),
                          ),

                          child: IconButton(
                            splashRadius: 25,
                            icon: const Icon(
                              FontAwesomeIcons.solidUser,
                              color: Colors.amber,
                            ),
                            onPressed: () {
                              // Navigator.of(context).pushNamed(EditProfile.routeName);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile(),));
                            },

                          ),
                        ),
                        Text(
                          '$name\'s home',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color(0xffdadada),
                            borderRadius:
                            BorderRadius.all(Radius.elliptical(45, 45)),
                          ),

                          child: IconButton(
                            splashRadius: 25,
                            icon: const Icon(
                              CupertinoIcons.calendar,
                              color: Colors.grey,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const SetEventScreen(),));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: Body(devices: devices,),
              ),
            ),
    );
  }
}
