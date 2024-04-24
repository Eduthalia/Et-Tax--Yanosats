import 'package:ettax/components/my_button.dart';
import 'package:ettax/components/my_nav_bar.dart';
import 'package:ettax/pages/invoice_page_upload.dart';
import 'package:ettax/services/FireBase/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_text_fied.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dateController = TextEditingController();
    final tinController = TextEditingController();
    final nameController = TextEditingController();
    final unitCOntroller = TextEditingController();
    final priceController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          "Invoices",
          style: GoogleFonts.acme(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.black,
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
                            builder: (context) => const InvoicePage()));
                  },
                  child: Tab(
                    child: Text(
                      "Create a new invoice",
                      style: GoogleFonts.acme(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 114, 172, 216)
                              .withOpacity(0.6)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InvoicePageUpload()));
                  },
                  child: Tab(
                    child: Text(
                      "Upload an invoice",
                      style: GoogleFonts.acme(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // MyTextField(hintText: "dd/mm/yyyy", controllers: dateController, obscureText: false)
            Padding(
              padding: const EdgeInsets.fromLTRB(200, 0, 10, 0),
              child: Row(
                children: [
                  const Text("Date: "),
                  const SizedBox(width: 5),
                  Expanded(
                    child: MyTextField(
                      hintText: "dd/mm/yyyy",
                      controllers: dateController,
                      obscureText: false,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 100, 0),
              child: Row(
                children: [
                  const Text("TIN: "),
                  const SizedBox(width: 20),
                  Expanded(
                    child: MyTextField(
                      hintText: "Client TIN",
                      controllers: tinController,
                      obscureText: false,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 100, 0),
              child: Row(
                children: [
                  const Text("Name: "),
                  const SizedBox(width: 5),
                  Expanded(
                    child: MyTextField(
                      hintText: "Client Name",
                      controllers: nameController,
                      obscureText: false,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Unit",
                    style: GoogleFonts.acme(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 114, 172, 216)
                          .withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Unit Price",
                    style: GoogleFonts.acme(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 114, 172, 216)
                          .withOpacity(0.6),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: MyTextField(
                          hintText: "amount",
                          controllers: unitCOntroller,
                          obscureText: false)),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: MyTextField(
                      hintText: "unit price",
                      controllers: priceController,
                      obscureText: false,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
              child: GestureDetector(
                  onTap: () {
                    String unitPrice = priceController.text;
                    double unitPriceInt = double.parse(unitPrice);

                    String amount = unitCOntroller.text;
                    double amountInt = double.parse(amount);

                    double totalPrice = amountInt * unitPriceInt;
                    double vat = totalPrice * 0.15;

                    FireStoreServices services = FireStoreServices();
                    services.addInvoice(
                        nameController.text,
                        tinController.text,
                        dateController.text,
                        unitCOntroller.text,
                        priceController.text,
                        totalPrice.toString(),
                        vat.toString());

                    dateController.clear();
                    tinController.clear();
                    nameController.clear();
                    unitCOntroller.clear();
                    priceController.clear();
                  },
                  child: const MyButton(text: "Add Invoice")),
            )
          ],
        ),
      ),
      bottomNavigationBar: const MyNavBar(index: 2),
    );
  }
}
