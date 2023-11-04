import 'package:domus/config/size_config.dart';
import 'package:domus/provider/base_view.dart';
import 'package:domus/src/screens/edit_profile/edit_profile.dart';
import 'package:domus/src/screens/favourites_screen/favourites_screen.dart';
import 'package:domus/src/widgets/custom_bottom_nav_bar.dart';
import 'package:domus/view/home_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../set_event_screen/set_event_screen.dart';
import 'components/body.dart';
import 'package:domus/src/screens/menu_page/menu_screen.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseView<HomeScreenViewModel>(
        onModelReady: (model) => {
              model.generateRandomNumber(),
            },
        builder: (context, model, child) {
          return DefaultTabController(
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
                        'Dat\'s home',
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
                            // Navigator.of(context).pushNamed(EditProfile.routeName);
                            // Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            //     Favourites(
                            //       model:model,
                            //     ),));
                            Navigator.of(context).pushNamed(SetEventScreen.routeName);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: Body(model: model),
            ),
          );
        });
  }
}
