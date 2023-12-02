import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Bacem Khlifi',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'bacem@mbkshopping.com',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle edit profile button press
              },
              child: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(),
            ),
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Personal Information'),
              onTap: () {
                // Navigate to personal information page
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('My Orders'),
              onTap: () {
                // Navigate to my orders page
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () {
                // Navigate to favorites page
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to settings page
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement sign out functionality
              },
              child: Text('Sign Out'),
              style: ElevatedButton.styleFrom(),
            ),
          ],
        ),
      ),
    );
  }
}
