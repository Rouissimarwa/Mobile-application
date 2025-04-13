import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CustomAppBarPage(),
  ));
}

class CustomAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF), // Définir la couleur de fond en blanc
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: ClipRRect(
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 252, 253, 253),
          ),
        ),
      ),
      body: SignInScreen(),
    );
  }
}

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign-in";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center( // Centrer l'image
          child: Image.asset(
            'assets/icons/tdiscount.jpeg',
            height: 50,
            width: 350,
            scale: 0.3, 
          ),
        ),
        Center( // Centrer le formulaire
          child: SignForm(),
        ),
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              height: 2,
              width: 100,
              color: Colors.black,
            ),
            SizedBox(width: 10),
            Text(
              "Inscrivez-vous avec",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(width: 10),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 2,
              width: 100,
              color: Colors.black,
            ),
          ],
        ),
       Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    IconButton(
      onPressed: () {
        // Action pour Facebook
      },
      icon: Icon(Icons.facebook),
      color: const Color.fromARGB(255, 5, 5, 5),
      iconSize: 30,
    ),
    IconButton(
      onPressed: () {
      
      },
      icon: Icon(Icons.apple),
      color: const Color.fromARGB(255, 6, 6, 6),
      iconSize: 30,
    ),
    IconButton(
      onPressed: () {
        
      },
      icon: Icon(Icons.tiktok),
      color: const Color.fromARGB(255, 6, 6, 6),
      iconSize: 30,
    ),
  ],
),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Want to create an account?"),
            TextButton(
              onPressed: () {
            
              },
              child: Text(
                "Sign up",
                style: TextStyle(
                  color: const Color(0xFF006583),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 20),
          buildEmailFormField(),
          SizedBox(height: 20),
          buildPasswordFormField(),
          SizedBox(height: 20),
          Container(
            width: double.infinity, 
            child: DefaultButton(
              text: "Continue",
              color: Color.fromRGBO(254, 214, 1, 1),
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  if (email!.isEmpty || password!.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Please enter email and password."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Gérer l'appui sur le bouton ici
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your email";
        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return "Please enter valid email";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback press;

  const DefaultButton({
    Key? key,
    required this.text,
    this.color,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.blue,
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign-up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Text(
          'Sign Up Screen',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
