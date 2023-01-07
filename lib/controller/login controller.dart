import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friendsforever/User/user.dart';
import 'package:friendsforever/pages/Home.dart';
import 'package:friendsforever/pages/login.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login_controller extends GetxController{
  static bool image_selected = false;
  static var cmpressed_image;
  static bool loading = false;
  static TextEditingController email_controller = new TextEditingController();
  static TextEditingController password_controller = new TextEditingController();
  static bool button_pressed = false;

  static create_account(context) async{
    var db = await Db.create("mongodb+srv://foreverfriends:ijRimwbl61aGQY2w@cluster0.wamtsqx.mongodb.net/forever_friend_api?retryWrites=true&w=majority");
    await db.open();
    var coll = db.collection('accounts');
    print(coll);
    print(await coll.find().toList());
    var email = await coll.find(where.eq('email', '${email_controller.text}')).toList();
    print("Email" + "$email");
    if(email.isEmpty){
      print("Account Not Found");
      Get.snackbar(
        "Account Not Found",
        "Please Enter Correct Credentials to continue",
        icon:
        Icon(Icons.error_outlined, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 4),
        isDismissible: true,
        // dismissDirection: SnackDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      email_controller.text = "";
      password_controller.text = "";
      image_selected = false;
      cmpressed_image = null;
      button_pressed = false;
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => login_page()));

    }else{
      if(email[0]["password"] == password_controller.text){
        user.name = email[0]["name"];
        user.email = email[0]["email"];
        user.password = email[0]["password"];
        user.admin = email[0]["admin"];
        user.profile = email[0]["profile"];
        var query = where.eq('name', '${email[0]["email"]}');
        var update  = modify.set('login', '1');
        coll.updateOne(query, update);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("Is_Logged_In", "true");
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home()), (route) => false);
      }else{
        print("Account Not Found");
        Get.snackbar(
          "Account Not Found",
          "Please Enter Correct Credentials to continue",
          icon:
          Icon(Icons.error_outlined, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Colors.white,
          duration: Duration(seconds: 4),
          isDismissible: true,
          // dismissDirection: SnackDismissDirection.HORIZONTAL,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        email_controller.text = "";
        password_controller.text = "";
        image_selected = false;
        cmpressed_image = null;
        button_pressed = false;
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => login_page()));
      }
    }
  }
}
