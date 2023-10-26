import 'package:flutter/material.dart';
import 'package:uts_week09/models/item.dart';
import 'package:uts_week09/pages/item_page.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 20000, image: 'gula.jpeg', stock: 51, rating: 4.7 ),
    Item(name: 'Salt', price: 2000, image: 'garam.jpg', stock: 20, rating: 5),
    Item(name: 'Rice', price: 70000, image: 'beras.jpg', stock: 10, rating: 4.9),
    Item(name: 'Oil', price: 15000, image: 'minyakk.jpg', stock: 15, rating: 4.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(item: item),),); // no 1
              },
            // ignore: dead_code, unused_label
            child: Card(
              elevation: 4,
              child: Column(
                children:[ Hero(tag: 'itemImage${item.name}', child: Image.asset(
                  'images/${item.image}',
                  height: 110,
                ),
                ),
                ListTile(
                  title: Text(
                    item.name, style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                         children: [
                          const Icon(Icons.attach_money),
                          Text('Price: \ ${item.price.toString()}'),
                         ], 
                      ),
                      Row(
                        children: [
                          const Icon(Icons.inventory),
                          Text('Stock: ${item.stock.toString()}'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star),
                          Text('Rating: ${item.rating.toString()}'),
                        ],
                        ),
                    ],
                  ),
                ),
                ],
              ),
            ),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Yisha Zukhrufin A  2141720013',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          ),
      ),
    );
  }
}
