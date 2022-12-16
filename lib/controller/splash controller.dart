
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friendsforever/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash_controller {
  static check_for_logeedin(context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 5),(){
      final prefs_login = prefs.getString("Is_Logged_In");
      if(prefs_login == null){
        print("No Records Founds :(.....");
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => login_page()), (route) => false);
      }else{
        print("Records Found :)..");
      }
    });
  }
}