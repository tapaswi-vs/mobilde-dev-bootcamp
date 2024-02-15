import 'package:flutter/material.dart';
import 'package:flutter_app_demo/screens/display_screen.dart';
import 'package:flutter_app_demo/screens/signup_screen.dart';

import '../user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  User? user;

  TextEditingController unameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: unameController,
            decoration: InputDecoration(
              //You can also use UnderlineInputBorder() class
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
                labelText: 'Enter your username'),
          ),

          SizedBox(height: 20),

          TextField(
            obscureText: true,
            controller: pwdController,
            decoration: InputDecoration(
              //You can also use UnderlineInputBorder() class
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
                labelText: 'Enter your Password'),
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async{
                    Navigator.of(context).pushNamed('/register');
                    // user = await Navigator.of(context).push<User>(
                    //     MaterialPageRoute(
                    //         builder: (context) => SignupForm()));

                    print('We have the user data!');
                  }, child: Text('Sign Up')),
              SizedBox(width: 20),
              ElevatedButton(
                  onPressed: (){
                    if(pwdController.text == user?.pwd){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) =>
                            DisplayScreen(user: user!))
                      );
                    }else{
                      // Error messgae
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Wrong Password!!'),
                            backgroundColor: Colors.red,
                          ));
                      // Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (context) =>
                      //         DisplayScreen(user: user ?? User(uname: 'Default', pwd: 'Default') ))
                      // );
                    }
                  }, child: Text('Login')),
            ],
          )

        ],
      ),
    );
  }
}
