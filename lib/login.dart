import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'otp.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController phoneController = TextEditingController();
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
          child: Icon(Icons.arrow_back,color: Colors.white,),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Image.asset("assets/icon.webp",scale: 7,),
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
                "Login",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(45),
              child: Container(

                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Enter your phone number',
                    hintText: '+91 0000000000',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffE1DEDE))),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffE1DEDE)))
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
            ),

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
                  onTap: () {Navigator.push( context,MaterialPageRoute(builder: (context) => otp()));},
                  child: Center(
                    child: Text(
                      "Login",
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
