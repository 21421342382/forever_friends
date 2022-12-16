import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:friendsforever/controller/login%20controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:image_picker/image_picker.dart';

class login_page extends StatefulWidget {
  login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  @override
  final picker = ImagePicker();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Theme Background 2.png"),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                "LOGIN",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 6,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    login_controller.loading = true;
                  });
                  final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    try {
                      login_controller.cmpressed_image =
                      await FlutterImageCompress.compressWithFile(
                          pickedFile.path,
                          format: CompressFormat.heic,
                          quality: 70);
                      print(login_controller.cmpressed_image);
                      setState(() {
                        login_controller.image_selected = true;
                        login_controller.loading = false;
                      });
                    } catch (e) {
                      login_controller.cmpressed_image =
                      await FlutterImageCompress.compressWithFile(
                          pickedFile.path,
                          format: CompressFormat.jpeg,
                          quality: 70);
                      print(login_controller.cmpressed_image);
                      setState(() {
                        login_controller.loading = false;
                        login_controller.image_selected = true;
                      });
                    }
                  }
                },
                child: Container(
                  height: 103,
                  width: 103,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      border: Border.all(color: Color(0xFFDBFF00))),
                  child: login_controller.loading
                  ?Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 1,),)
                  :Center(
                    child: login_controller.image_selected
                        ? ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      child: Image.memory(login_controller.cmpressed_image,
                          fit: BoxFit.fill,height: 103,width: 103,),
                    )
                        : Icon(
                      Icons.add_photo_alternate_outlined,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    "Email",
                    style: TextStyle(
                        fontSize: 14, color: Colors.grey.shade400),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xFFFFFCFC).withOpacity(0.33)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: TextFormField(
                        controller: login_controller.email_controller,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration.collapsed(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Color(0xFFCBCBCB),
                              fontSize: 14,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 14, color: Colors.grey.shade400),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xFFFFFCFC).withOpacity(0.33)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: TextFormField(
                        controller: login_controller.password_controller,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration.collapsed(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Color(0xFFCBCBCB),
                              fontSize: 14,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                  EdgeInsets.only(bottom: 30, left: 20, right: 20),
                  child: InkWell(
                    onTap: () {
                      if(login_controller.email_controller.text == ""){
                        Get.snackbar(
                          "Invalid Email Address",
                          "Please Enter Email Address to continue",
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
                      }else{
                        if(login_controller.password_controller.text == ""){
                          Get.snackbar(
                            "Invalid Password",
                            "Please Enter Password to continue",
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
                        }else{
                          setState(() {
                            login_controller.button_pressed = true;
                          });
                          login_controller.create_account(context);
                        }
                      }
                    },
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(30)),
                          color: Color(0xFF325AE7).withOpacity(0.71)),
                      child: Center(
                        child: login_controller.button_pressed
                        ?CircularProgressIndicator(color: Colors.white,strokeWidth: 1,)
                            :Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
