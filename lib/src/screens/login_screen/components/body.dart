import 'package:domus/config/size_config.dart';
import 'package:domus/src/screens/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
	const Body({Key? key}) : super(key: key);

	@override
  Widget build(BuildContext context) {

    return Column(
	        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
				SizedBox(height: getProportionateScreenHeight(100)),
        // Stack(
	      //   children: [
	      //   	Image.asset('assets/images/login.png',
				//         height: getProportionateScreenHeight(300),
	      //   	width: double.infinity,
	      //   	fit: BoxFit.fill,),
				//
		    //     Positioned(
			  //       bottom: getProportionateScreenHeight(20),
			  //       left: getProportionateScreenWidth(20),
			  //       child: Column(
				//
				//         crossAxisAlignment: CrossAxisAlignment.start,
				//
				//       children: [
				//       	Text('SMART',style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black, fontSize: 33),),
				// 	      Text('HOME', style:  Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black, fontSize: 64),)
				//       ],
		    //     )),
	      //   ],
        // ),
				Column(
				crossAxisAlignment: CrossAxisAlignment.center,
				children: [
				Container(
					width: 320,
					height: 320,
					decoration: BoxDecoration(
							border: Border.all(color: Colors.black54),
							borderRadius: BorderRadius.circular(20.0),
					),
					child: const Stack(
						children: [
							Positioned(
								left: 26,
								top: 148,
								child: SizedBox(
									width: 268,
									height: 70,
									child: Text(
										'Smart Home',
										textAlign: TextAlign.center,
										style: TextStyle(
											color: Colors.black,
											fontSize: 36,
											fontWeight: FontWeight.w400,
											height: 0,
										),
									),
								),
							),
							Positioned(
								left: 11.52,
								top: 249.60,
								child: SizedBox(
									width: 295.68,
									height: 60.16,
									child: Text(
										'Wellcome home, login to manage your devicess',
										textAlign: TextAlign.center,
										style: TextStyle(
											color: Colors.black,
											fontSize: 20,
											fontWeight: FontWeight.w400,
											height: 0,
										),
									),
								),
							),
							Positioned(
								left: 110,
								top: 33,
								child: Icon(
									CupertinoIcons.home,
									color: Colors.black,
									size: 100,
								),
							),
						],
					),
				),
				],
				),
	          // const Padding(
	          //   padding: EdgeInsets.all(20.0),
	          //   child: Text('sign into \nmange your device & accessory',style: TextStyle(fontSize: 18),),
	          // ),
				SizedBox(height: getProportionateScreenHeight(20)),
	          Padding(
		          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
		          child: TextField(

			          decoration: InputDecoration(
				          contentPadding: const EdgeInsets.only(left: 40.0, right: 20.0),
				          border: OutlineInputBorder(borderRadius: BorderRadius.circular(70.0),),
				          hintText: 'Email',
				          suffixIcon: const Icon(Icons.email, color: Colors.black,)
			          ),),
	          ),

				SizedBox(height: getProportionateScreenHeight(20)),
				Padding(
					padding: const EdgeInsets.only(left: 20.0, right: 20.0),
					child: TextField(

						decoration: InputDecoration(
							contentPadding: const EdgeInsets.only(left: 40.0, right: 20.0),
							border: OutlineInputBorder(borderRadius: BorderRadius.circular(70.0),),
							hintText: 'Password',
							suffixIcon: const Icon(Icons.lock, color: Colors.black,)
						),),
				),
				SizedBox(height: getProportionateScreenHeight(20)),
				Padding(
					padding: const EdgeInsets.only(left: 20.0, right: 20),
					child: InkWell(
						onTap: (){
							Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

						},
						child: Container(
					width: double.infinity,
					padding: const EdgeInsets.all(16.0),
					decoration:BoxDecoration(
						color: const Color(0xFF464646),
						borderRadius:BorderRadius.circular(70.0), ),alignment: Alignment.center,
					child: const Text('Login in', style: TextStyle(color: Colors.white),),),
					),
				),
				SizedBox(height: getProportionateScreenHeight(10)),
				const Center(child: Text('Don\'t have an account yet?'))
      ],
    );
  }
}
