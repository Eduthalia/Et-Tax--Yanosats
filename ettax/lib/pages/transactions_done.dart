import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ettax/components/my_nav_bar.dart';
import 'package:ettax/pages/transactions_pending.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/transactions_container.dart';

class TransactionDone extends StatelessWidget {
  const TransactionDone({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 2;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          "Reminder",
          style: GoogleFonts.acme(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TransactionPending()));
                  },
                  child: Tab(
                    child: Text(
                      "Pending Transaction ...",
                      style: GoogleFonts.acme(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TransactionDone()));
                  },
                  child: Tab(
                    child: Text(
                      "Finished Transaction",
                      style: GoogleFonts.acme(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 114, 172, 216)
                            .withOpacity(0.6),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('transactions')
                  .where('status',
                      isEqualTo: 'done') // Filter only 'undone' transactions
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DocumentSnapshot> documents = snapshot.data!.docs;
                  return Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Adjust the left padding as needed
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: documents.map((document) {
                        String name = document['name'];
                        String dueDate = document['duedate'];
                        String amount = document['amount'];
                        String status = document['status'];
                        String dateName =
                            status == "done" ? "Date" : "Due Date";
                        Color iconColor =
                            status == "done" ? Colors.green : Colors.red;
                        Color textColor = status == 'done'
                            ? Colors.black
                            : const Color.fromARGB(255, 114, 172, 216);
                        Color backgroundColor =
                            status == 'done' ? Colors.white : Colors.black;
                        Color shadowColor = status == 'done'
                            ? const Color.fromARGB(255, 114, 172, 216)
                                .withOpacity(0.4)
                            : Colors.black.withOpacity(0.2);

                        IconData iconName = status == 'done'
                            ? Icons.done_all
                            : Icons.pending_actions;

                        return TransactionContainer(
                          dateName: dateName,
                          iconColor: iconColor,
                          iconName: iconName,
                          amount: amount,
                          dueDate: dueDate,
                          name: name,
                          textColor: textColor,
                          backgroundColor: backgroundColor,
                          shadowColor: shadowColor,
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
      bottomNavigationBar: const MyNavBar(index: 3),
    );
  }
}
