import 'package:flutter/material.dart';

class AddCardPage extends StatefulWidget {
  final Function(String, String) onCardAdded;

  AddCardPage({required this.onCardAdded});

  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();

  String cardNumber = '**** **** **** ****';
  String expiryDate = 'MM/YY';

  @override
  void initState() {
    super.initState();


    _cardNumberController.addListener(() {
      setState(() {
        cardNumber = _cardNumberController.text.isEmpty
            ? '**** **** **** ****'
            : _cardNumberController.text;
      });
    });

    _expiryDateController.addListener(() {
      setState(() {
        expiryDate = _expiryDateController.text.isEmpty
            ? 'MM/YY'
            : _expiryDateController.text;
      });
    });
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [

                  Positioned(
                    top: 60,
                    left: 20,
                    child: Text(
                      cardNumber,
                      style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 2.0,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Text(
                      expiryDate,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),


            TextField(
              controller: _cardNumberController,
              decoration: InputDecoration(
                labelText: 'Enter Card Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              maxLength: 19,
            ),
            SizedBox(height: 20),

            // Enter Expiration Date
            TextField(
              controller: _expiryDateController,
              decoration: InputDecoration(
                labelText: 'Enter Expiration Date (MM/YY)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
              maxLength: 5,
            ),
            SizedBox(height: 20),

            // Footer Text
            Text(
              '* Only Visa, MasterCard Issued cards supported',
              style: TextStyle(color: Colors.black54, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Add Card Button


            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final cardNumberInput = _cardNumberController.text;
                final expiryDateInput = _expiryDateController.text;
                if (cardNumberInput.isNotEmpty && expiryDateInput.isNotEmpty) {
                  widget.onCardAdded(cardNumberInput, expiryDateInput);
                  Navigator.pop(context);
                }
              },
              child: Text('Save', style: TextStyle(color: Colors.white),),
            ),

          ],
        ),
      ),
    );
  }
}
