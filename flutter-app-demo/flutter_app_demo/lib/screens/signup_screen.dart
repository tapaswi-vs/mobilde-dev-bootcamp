import 'package:flutter/material.dart';
import 'package:flutter_app_demo/user.dart';

class SignupForm extends StatelessWidget {
  TextEditingController unameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Yourself')),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text('Uname: '),
              Expanded(
                child: TextField(
                  controller: unameController,
                ),
              )
            ],
          ),
          Row(
            children: [
              Text('PWD: '),
              Expanded(
                child: TextField(
                  controller: pwdController,
                  obscureText: true,
                ),
              )
            ],
          ),

          ElevatedButton(
            onPressed: (){
              User user = User(uname: unameController.text, pwd: pwdController.text);
              Navigator.of(context).pop(user);
            },
            child: Text('Submit'),
          )

        ],
      ),
    );
  }
}
