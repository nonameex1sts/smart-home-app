import 'package:domus/config/size_config.dart';
import 'package:domus/src/screens/edit_device/edit_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DarkContainer extends StatefulWidget {
  final String iconAsset;
  final String type;
  final String description;
  bool isOn;
  DarkContainer({
    Key? key,
    required this.iconAsset,
    required this.type,
    required this.description,
    required this.isOn,
  }) : super(key: key);

  @override
  State<DarkContainer> createState() => _DarkContainerState();
}

class _DarkContainerState extends State<DarkContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(140),
      height: getProportionateScreenHeight(140),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.isOn
            ? const Color.fromRGBO(0, 0, 0, 1)
            : const Color(0xffededed),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: widget.isOn
                        ? const Color.fromRGBO(45, 45, 45, 1)
                        : const Color(0xffdadada),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(45, 45)),
                  ),
                  child: SvgPicture.asset(
                    widget.iconAsset,
                    color: widget.isOn ? Colors.amber : const Color(0xFF808080),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EditDevice(),));
                  },
                  child:  const Icon(
                    Icons.edit,
                    color: Color(0xFF808080),
                    size: 30,
                    // color: Color(0xFF808080),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.type,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: widget.isOn ? Colors.white : Colors.black,
                      ),
                ),
                Text(
                  widget.description,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Color.fromRGBO(166, 166, 166, 1),
                      fontSize: 13,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1.6),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.isOn ? 'On' : 'Off',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: widget.isOn ? Colors.white : Colors.black,
                      ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      widget.isOn = !widget.isOn;
                    });
                  },
                  child: Container(
                    width: 48,
                    height: 25.6,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: widget.isOn ? Colors.black : const Color(0xffd6d6d6),
                      border: Border.all(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        width: widget.isOn ? 2 : 0,
                      ),
                    ),
                    child: Row(
                      children: [
                        widget.isOn ? const Spacer() : const SizedBox(),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
