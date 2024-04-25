import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ettax/components/customers_list.dart';
import 'package:ettax/pages/search_page.dart';
import 'package:flutter/material.dart';

class Pension extends StatelessWidget {
  const Pension({Key? key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
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
          'Client List',
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
                          Color textColor = Colors.black;
                          Color backgroundColor = Colors.white;
                          Color shadowColor = Colors.black;
                          if (counter % 2 != 0) {
                            textColor = Colors.black;
                            backgroundColor = Colors.white;
                            shadowColor =
                                const Color.fromARGB(255, 114, 172, 216)
                                    .withOpacity(0.6);
                          }
                          List<DocumentSnapshot> documents =
                              snapshot.data!.docs;
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 0), // Adjust the left padding as needed
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: documents.map((document) {
                                //counter++;
                                if (counter % 2 == 0) {
                                  textColor = Colors.black;
                                  backgroundColor = Colors.white;
                                  shadowColor =
                                      const Color.fromARGB(255, 114, 172, 216)
                                          .withOpacity(0.6);
                                }
                                String customerName = document['name'];
                                String tin = document['tin'];
                                String income = document['income'];
                                String vat = document['vat'];
                                if (counter % 2 == 0) {
                                  return CustomersLists(
                                    customerName: customerName,
                                    tin: tin,
                                    income: income,
                                    vat: vat,
                                    backgroundColor: backgroundColor,
                                    shadowColor: shadowColor,
                                    textColor: textColor,
                                  );
                                } else {
                                  return CustomersLists(
                                    customerName: customerName,
                                    tin: tin,
                                    income: income,
                                    vat: vat,
                                  );
                                }
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
        ],
      ),
    );
  }
}
