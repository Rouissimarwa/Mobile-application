import 'package:flutter/material.dart';
import 'package:untitled2/page/mdp.dart';
import 'package:untitled2/page/page/adesse.dart';
import 'package:untitled2/page/sidebar.dart';

 // Import the ProfilePage class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
    );
  }
}

class Profile extends StatelessWidget { // Change the class name here
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF006583),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Increase the height to make room for the photo
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 101, 131),
            title: Row(
              children: [
               
          
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 208, 208, 219),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        height: 900, // Fixed height of the body
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTileWithEditButton(
                  title: 'Mon adresse',
                  subtitle: 'Définir l\'adresse de livraison d\'achat',
                  leadingIcon: 'assets/icons/local.png',
                  onTap: () {
                   
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  AdressePage()),
                    );
                  },
                ),
                ListTileWithEditButton(
                  title: 'Mon panier',
                  subtitle: 'Ajouter supprimer le produit et passer a la caisse',
                  leadingIcon: 'assets/icons/panier1.png',
                  onTap: () {
                    // Action to perform when "Mon panier" is clicked AdressePageState
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavBar()),
                    );
                  },
                ),
                ListTileWithEditButton(
                  title: 'Mes commandes',
                  subtitle: 'commades en cours et terminé',
                  leadingIcon: 'assets/icons/panier.png',
                  onTap: () {
                    // Action to perform when "Mes commandes" is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavBar()),
                    );
                  },
                ),
                ListTileWithEditButton(
                  title: 'Favoris',
                  subtitle: 'retirer le solde sur un compte bancaire enregistré',
                  leadingIcon: 'assets/icons/favoris.png',
                  onTap: () {
                    // Action to perform when "Favoris" is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavBar()),
                    );
                  },
                ),
                ListTileWithEditButton(
                  title: 'Mes cupons',
                  subtitle: 'liste de tous les cupons reduits',
                  leadingIcon: 'assets/icons/cupons.png',
                  onTap: () {
                    // Action to perform when "Mes cupons" is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NavBar()),
                    );
                  },
                ),
                ListTileWithEditButton(
                  title: 'change mot de passe  ',
                  subtitle: 'change mot de passe pour securite votre compte ',
                  leadingIcon: 'assets/icons/confidentialite.png',
                  onTap: () {
                    // Action to perform when "Confidentialité du compte" is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MotDePassePage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListTileWithEditButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final String leadingIcon;
  final VoidCallback? onTap;

  const ListTileWithEditButton({
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(
            leadingIcon,
            width: 32,
            height: 32,
          ),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: InkWell(
            child: Image.asset(
              'assets/icons/fat7.png',
              width: 24,
              height: 24,
              color: Colors.black,
            ),
            onTap: onTap,
          ),
        ),
        Divider(),
      ],
    );
  }
}

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Page'),
      ),
      body: Center(
        child: Text('This is the Address Page'),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Center(
        child: Text('This is the Cart Page'),
      ),
    );
  }
}

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders Page'),
      ),
      body: Center(
        child: Text('This is the Orders Page'),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites Page'),
      ),
      body: Center(
        child: Text('This is the Favorites Page'),
      ),
    );
  }
}

class CouponsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coupons Page'),
      ),
      body: Center(
        child: Text('This is the Coupons Page'),
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title
: Text('Notification Page'),
      ),
      body: Center(
        child: Text('This is the Notification Page'),
      ),
    );
  }
}

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Page'),
      ),
      body: Center(
        child: Text('This is the Privacy Page'),
      ),
    );
  }
}
