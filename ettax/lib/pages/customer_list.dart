import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ettax/components/customers_list.dart';
import 'package:ettax/pages/search_page.dart';
import 'package:flutter/material.dart';

import 'add_customer.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
              icon: const Icon(Icons.search_outlined))
        ],
        title: const Text(
          'Customer List',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('customers')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<DocumentSnapshot> documents =
                              snapshot.data!.docs;
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 0), // Adjust the left padding as needed
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: documents.map((document) {
                                String customerName = document['name'];
                                String tin = document['tin'];
                                String income = document['income'];
                                String vat = document['vat'];

                                return CustomersLists(
                                  customerName: customerName,
                                  tin: tin,
                                  income: income,
                                  vat: vat,
                                );
                              }).toList(),
                            ),
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black, // text color
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCustomer()));
              },
              child: const Text('Add Customer', style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
