import 'package:flutter/material.dart';
import 'home.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _ctController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _EController = TextEditingController();
  TextEditingController _PController = TextEditingController();
  TextEditingController _PassController = TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/background.png'),
          )),
          child: Form(
            key: _registerFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                inputField(
                    'CareTaker Name', _ctController, 'Enter Value', false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                inputField('User Name', _nameController, 'Enter Value', false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                inputField('Email address', _EController, 'Enter Value', false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                inputField('Phone Number', _PController, 'Enter Value', false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                inputField('Password', _PassController, 'Enter Value', true),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.08,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.teal,
                    ),
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.5,
                        maxWidth: MediaQuery.of(context).size.width * 0.5),
                    child: IconButton(
                      icon: Icon(Icons.navigate_next),
                      onPressed: () {
                        if (_registerFormKey.currentState.validate()) {
                          print('validated');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } else {
                          print('invalid');
                        }
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container inputField(String hint, TextEditingController controller,
      String validateFailTxt, bool ispass) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.2),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validateFailTxt;
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          hintText: hint,
        ),
        obscureText: ispass,
      ),
    );
  }
}
