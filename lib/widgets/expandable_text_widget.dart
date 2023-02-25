import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ExpandandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandandableTextWidget({super.key, required this.text});

  @override
  State<ExpandandableTextWidget> createState() =>
      _ExpandandableTextWidgetState();
}

class _ExpandandableTextWidgetState extends State<ExpandandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 4.67;

  @override
  void initState() {
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return secondHalf.isEmpty
        ? SmallText(
            height: 1.5,
            text: firstHalf,
            color: AppColor.paraColor,
          )
        : Column(
            children: [
              SmallText(
                  height: 1.5,
                  size: 15,
                  color: AppColor.paraColor,
                  text: hiddenText
                      ? ('$firstHalf...')
                      : (firstHalf + secondHalf)),
              InkWell(
                onTap: () {
                  setState(() {
                    hiddenText = !hiddenText;
                  });
                },
                child: Row(children: [
                  SmallText(
                    text: 'Show more',
                    color: AppColor.mainColor,
                  ),
                  Icon(
                    hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                    color: AppColor.mainColor,
                  ),
                ]),
              )
            ],
          );
  }
}
