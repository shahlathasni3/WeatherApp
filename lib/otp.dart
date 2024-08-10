import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'home.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Image.asset(
              "assets/icon.webp",
              scale: 7,
            ),
          )
        ],
        elevation: 0,
      ),
      body: Container(
        height: height * 1,
        width: width * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffAD52D0),
              Color(0xff5A42B1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "OTP",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "Enter verification Code",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 15,
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            Text(
              "Code sent to Your mobile number",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Enter your OTP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffE1DEDE))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffE1DEDE)))
                ),
              ),
            ),
            // OtpTextField(
            //
            //   numberOfFields: 4,
            //   borderColor: Color(0xFFffffff),
            //   //set to true to show as box or false to show as dash
            //   showFieldAsBox: true,
            //   //runs when a code is typed in
            //   onCodeChanged: (String code) {
            //     //handle validation or checks here
            //   },
            //   //runs when every textfield is filled
            //   onSubmit: (String verificationCode){
            //     showDialog(
            //         context: context,
            //         builder: (context){
            //           return AlertDialog(
            //             title: Text("Verification Code"),
            //             content: Text('Code entered is $verificationCode'),
            //           );
            //         }
            //     );
            //   }, // end onSubmit
            // ),


            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Container(
                height: height * 0.07,
                width: width * 0.65,
                decoration: BoxDecoration(
                    color: Color(0xffE1DEDE),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: InkWell(
                  onTap: () {Navigator.push( context,MaterialPageRoute(builder: (context) => home()));},
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
