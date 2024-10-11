import 'package:flutter/material.dart';
import 'add_card_page.dart';

class CardListPage extends StatefulWidget {
  @override
  _CardListPageState createState() => _CardListPageState();
}

class _CardListPageState extends State<CardListPage> {
  List<Map<String, String>> cardList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card List', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: cardList.isEmpty
                  ? Center(
                child: Text(
                  'No Cards Added Yet!',
                  style: TextStyle(fontSize: 18),
                ),
              )
                  : ListView.builder(
                itemCount: cardList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Image(
                            image: AssetImage("assets/images/visa.png"),
                          ),
                        ),
                      ),
                      title: Text('${cardList[index]["number"]}'),
                      subtitle: Text('${cardList[index]["expiry"]}'),
                      trailing: Icon(Icons.credit_card),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue,
          ),
          child: MaterialButton(
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddCardPage(
                    onCardAdded: (cardNumber, expiryDate) {
                      setState(() {

                        cardList.add({
                          "number": cardNumber,
                          "expiry": expiryDate,
                        });
                      });
                    },
                  ),
                ),
              );
            },
            child: Text('Add Card', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),

            ),
          ),
        ),
      );
  }
}
