import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ettax/components/customers_list.dart';
import 'package:flutter/material.dart';

import '../components/search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String _searchKey; // Declare _searchKey as a member variable

  @override
  void initState() {
    super.initState();
    _searchKey = ''; // Initialize _searchKey in initState
  }

  // Define a callback function to receive the updated _searchKey value
  void updateSearchKey(String value) {
    setState(() {
      _searchKey = value;
      print(
          'Search Key: $_searchKey'); // Do whatever you want with the search key
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: SearchBarCustom(
                        onUpdateSearchKey: updateSearchKey,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('customers')
                      .where('tin', isEqualTo: _searchKey)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<DocumentSnapshot> documents = snapshot.data!.docs;
                      return Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        children: documents.map((document) {
                          String income = document['income'];
                          String tin = document['tin'];
                          String vat = document['vat'];
                          String name = document['name'];
                          return CustomersLists(
                              customerName: name,
                              tin: tin,
                              income: income,
                              vat: vat);
                        }).toList(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
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
