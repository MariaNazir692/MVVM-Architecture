import 'package:flutter/material.dart';

import '../color.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({Key? key,
  required this.text,
  required this.onPress,
    this.loading=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        child: loading?CircularProgressIndicator(color: Colors.white,):Text(text, style: TextStyle(
          color: AppColor.whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 15
        ),),
      style: ElevatedButton.styleFrom(
          foregroundColor: AppColor.buttonColor,
          shape: StadiumBorder(),
        fixedSize: Size(200, 50)
      ),

    );
  }
}
