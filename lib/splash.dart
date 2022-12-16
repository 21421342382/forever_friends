import 'package:flutter/cupertino.dart';
import 'package:friendsforever/controller/splash%20controller.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    splash_controller.check_for_logeedin(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Theme Background.png"),fit: BoxFit.fill
        )
      ),
    );
  }
}
