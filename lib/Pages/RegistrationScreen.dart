import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app_firebase/GetXHelper/FirebaseController.dart';
import 'package:todo_app_firebase/Pages/LoginScreen.dart';
import 'package:todo_app_firebase/Widgets/SocialSignInWidgetRow.dart';
import 'package:velocity_x/velocity_x.dart';

class RegistrationScreen extends GetWidget<FirebaseController> {

  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Images/Assets/backgroundUI.png"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20,40 , 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 100,
                            width: 100,
                            child: Image.asset("Images/Assets/TodoLogo.png")),
                        HeightBox(10),
                        "Login".text.color(Colors.white).size(20).make(),
                        HeightBox(
                            20
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextFormField(
                            validator: (value) => value.isEmpty ? "The name field cannot be empty" : null,
                            controller: firstname,
                            decoration: InputDecoration(
                              hintText: 'First Name',
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.white
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Colors.blue[400]
                                  )
                              ),
                              isDense: true,                      // Added this
                              contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                            ),
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        HeightBox(
                            20
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextFormField(
                            validator: (value) => value.isEmpty ? "The last name field cannot be empty" : null,
                            controller: lastname,
                            decoration: InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.white
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Colors.blue[400]
                                  )
                              ),
                              isDense: true,                      // Added this
                              contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                            ),
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        HeightBox(
                            20
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextFormField(
                            validator: (value) => !value.contains('@') ? 'Enter a valid email' : null,
                            controller: email,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.white
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Colors.blue[400]
                                  )
                              ),
                              isDense: true,                      // Added this
                              contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                            ),
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        HeightBox(
                            20
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextFormField(
                            validator: (value) => value.isEmpty ? "The password field cannot be empty" : null,
                            obscureText: true,
                            controller: password,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.white
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Colors.blue[400]
                                  )
                              ),
                              isDense: true,                      // Added this
                              contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                            ),
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        HeightBox(20),
                        GestureDetector(
                            onTap: (){
                              if(_formKey.currentState.validate()) {
                                RegisterUser();
                              }
                            },
                            child: "Sign-Up".text.white.light.xl.makeCentered().box.white.shadowOutline(outlineColor: Colors.grey).color(Color(0XFFFF0772)).roundedLg.make().w(150).h(40)),
                        HeightBox(140),
                        "Login with".text.black.makeCentered(),
                        SocialSignInWidgetRow()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          },
          child: RichText(text: TextSpan(
            text: 'New User?',
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' Login Now',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0XFF4321F5)),
              ),
            ],
          )
          ).pLTRB(20, 0, 0, 15),
        )
    );
  }

  void RegisterUser() {
    controller.createUser(firstname.text,lastname.text,email.text,password.text);
  }
}