import 'package:flutter/material.dart';
import 'package:todo_app_firebase/Pages/LoginScreen.dart';
import 'package:todo_app_firebase/Pages/RegistrationScreen.dart';
import 'package:todo_app_firebase/Widgets/SocialSignInWidgetRow.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomeScreen extends StatelessWidget {
  bool back = false;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(onWillPop: () async {
        print(i);
        if(i==0) {
          i++;
        }else {
          back = true;
        }
        return back;
      },
      child: SafeArea(
          child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Images/Assets/backgroundUI.png')
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('Images/Assets/TodoLogo.png'),
                  ),
                  HeightBox(10),
                  "Welcome, Nice to see you again".text.color(Colors.white).size(20).make(),
                  HeightBox(20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: "Login".text.
                    white.
                    light.
                    xs.
                    makeCentered().
                    box.
                    white.
                    shadowOutline(outlineColor: Colors.grey).
                    color(Color(0XFFFF0772)).
                    roundedLg.
                    make().
                    w(150).
                    h(40),
                  ),
                  HeightBox(20),
                  "Login with".text.white.makeCentered(),
                  HeightBox(20),

                  SocialSignInWidgetRow()
                ],
              ),
            )
        ],
      ),
      ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
        },
        child: RichText(text: TextSpan(
          text: 'New User?',
          style: TextStyle(fontSize: 15.0, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: ' Register Now',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0XFF4321F5)),
            ),
          ],
        )
        ).pLTRB(20, 0, 0, 15),
      ),
    );
  }
}
