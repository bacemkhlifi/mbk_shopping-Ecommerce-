import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            FAQItem(
              question: 'How can I reset my password?',
              answer: 'You can reset your password by...',
            ),
            FAQItem(
              question: 'How do I contact customer service?',
              answer: 'Our customer service team is available at...',
            ),
            // Add more FAQ items as needed
            SizedBox(height: 20.0),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text("If you need additional assistance, please contact us at:"),
            SizedBox(height: 10.0),
            Text(
              'Email: support@mbkshopping.com',
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              'Phone: +216 53 780 888',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
   
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            answer,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}
