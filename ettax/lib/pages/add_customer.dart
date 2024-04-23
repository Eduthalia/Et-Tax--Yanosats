import 'package:ettax/components/my_text_fied.dart';
import 'package:ettax/services/FireBase/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final nameController = TextEditingController();
  final tinController = TextEditingController();
  final incomeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Adding Customer..."),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                "Customer Name",
                style: GoogleFonts.acme(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MyTextField(
                  hintText: "Name",
                  controllers: nameController,
                  obscureText: false),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                "Customer TIN",
                style: GoogleFonts.acme(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MyTextField(
                  hintText: "TIN",
                  controllers: tinController,
                  obscureText: false),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                "Customer Income",
                style: GoogleFonts.acme(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MyTextField(
                  hintText: "Income",
                  controllers: incomeController,
                  obscureText: false),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
                child: IconButton(
                    onPressed: () {
                      double vat;
                      String incomeText = incomeController.text;
                      double income = double.tryParse(incomeText) ?? 0;
                      
                      if (income >= 500 && income < 2000) {
                        vat = income * 0.05;
                      } else if (income >= 200 && income < 10000) {
                        vat = income * 0.1;
                      } else {
                        vat = income * 0.15;
                      }
        
                      FireStoreServices firestoreServices = FireStoreServices();
                      firestoreServices.addCustomer(
                          nameController.text,
                          tinController.text,
                          incomeController.text,
                          vat.toString());
                          
                      nameController.clear();
                      tinController.clear();
                      incomeController.clear();
                    },
                    icon: const Icon(
                      Icons.add_box,
                      size: 80,
                      color: Colors.black,
                    )))
          ],
        ),
      ),
    );
  }
}
