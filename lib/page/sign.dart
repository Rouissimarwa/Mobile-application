import 'package:flutter/material.dart';
import 'package:untitled2/page/connecte.dart'; // Importer le fichier connecte.dart
 // Importer le fichier sign.dart

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _zipController = TextEditingController();
  bool _isChecked = false;
  String _selectedCivilite = '';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        
                      },
                    ),
                    SizedBox(width: 10.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.only(top: 5.0, bottom: 3.0),
                        child: Text(
                          'Créez votre compte',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Text("Civilité:"),
                    Radio(
                      value: 'homme',
                      groupValue: _selectedCivilite,
                      onChanged: (value) {
                        setState(() {
                          _selectedCivilite = value.toString();
                        });
                      },
                    ),
                    Text('Homme'),
                    Radio(
                      value: 'femme',
                      groupValue: _selectedCivilite,
                      onChanged: (value) {
                        setState(() {
                          _selectedCivilite = value.toString();
                        });
                      },
                    ),
                    Text('Femme'),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: (screenWidth - 50) / 2,
                        child: _buildTextField(
                            'Prénom*', Icons.person, _firstNameController),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: SizedBox(
                        width: (screenWidth - 50) / 2,
                        child: _buildTextField(
                            'Nom*', Icons.person, _lastNameController),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  width: screenWidth - 40.0,
                  child: _buildTextField(
                      'Adresse e-mail*', Icons.email, _emailController),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  width: screenWidth - 40.0,
                  child: _buildTextField(
                      'Mot de passe*', Icons.lock, _passwordController,
                      isPassword: true),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  width: screenWidth - 40.0,
                  child: _buildTextField(
                      'Confirmation du mot de passe*', Icons.lock,
                      _confirmPasswordController,
                      isPassword: true),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  width: screenWidth - 40.0,
                  child: _buildTextField(
                      'Numéro télephone *', Icons.phone, _zipController, // Correction du contrôleur du numéro de téléphone
                      isPassword: true),
                ),
                SizedBox(height: 10.0),
                SizedBox(height: 10.0),
                SizedBox(
                  width: screenWidth - 40.0,
                  child: _buildTextField(
                      'Adresse*', Icons.location_on, _addressController),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: (screenWidth - 50) / 2,
                        child: _buildTextField(
                            'Ville*', Icons.villa_rounded, _cityController),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: SizedBox(
                        width: (screenWidth - 50) / 2,
                        child: _buildTextField(
                            'Code postal*', Icons.folder_zip, _zipController),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Flexible(
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(fontSize: 12.0, color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'J\'accepte les ',
                            ),
                            TextSpan(
                              text: 'politiques de confidentialité',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: const Color(0xFF006583),
                              ),
                            ),
                            TextSpan(
                              text: ' et les ',
                            ),
                            TextSpan(
                              text: 'conditions d\'utilisation',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: const Color(0xFF006583),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _signUp();
                    },
                    child: Text(
                      'Continuer',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 101, 131),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Column(
                  children: [
                    Text("Inscrivez-vous avec"),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.facebook),
                          onPressed: () {
                            // Inscription avec Facebook
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.verified_user_sharp),
                          onPressed: () {
                            // Inscription avec Google
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.apple),
                          onPressed: () {
                            // Inscription avec Apple
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Avez-vous déjà un compte?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignInScreen.routeName); // Naviguer vers la page de connexion
                      },
                      child: Text(
                        "Connectez-vous",
                        style: TextStyle(
                          color: const Color(0xFF006583),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon,
      TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  void _signUp() {
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();
    String address = _addressController.text.trim();
    String city = _cityController.text.trim();
    String zip = _zipController.text.trim();

    if (password != confirmPassword) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text('Les mots de passe ne correspondent pas.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    print('Prénom: $firstName');
    print('Nom: $lastName');
    print('Email: $email');
    print('Mot de passe: $password');
    print('Adresse: $address');
    print('Ville: $city');
    print('Code postal: $zip');
  }
}

void main() {
  runApp(MaterialApp(
    home: SignUpScreen(),
  ));
}
