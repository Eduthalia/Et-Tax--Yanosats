import 'dart:typed_data';

import 'package:ettax/components/my_button.dart';
import 'package:ettax/components/my_nav_bar.dart';
import 'package:ettax/services/FireBase/firestore_services.dart';
import 'package:ettax/services/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../components/my_text_fied.dart';
import 'invoics_page_create.dart';

class WithHolding extends StatefulWidget {
  const WithHolding({super.key});

  @override
  State<WithHolding> createState() => _WithHoldingState();
}

class _WithHoldingState extends State<WithHolding> {
  FireStoreServices services = FireStoreServices();
  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tinController = TextEditingController();
    final nameController = TextEditingController();
    void saveInvoice() async {
      // ignore: unused_local_variable
      String resp = await services.saveInvoiceImage(
          nameController.text, _image!, tinController.text);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          "Withholdings",
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
            const SizedBox(
              height: 150,
            ),
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 65,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : const CircleAvatar(
                        radius: 65,
                        backgroundImage: AssetImage("images/invoiceImage.png"),
                      ),
                Positioned(
                    left: 90,
                    top: 80,
                    child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                          size: 30,
                          color: Colors.black,
                        )))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
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
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
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
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
              child: GestureDetector(
                  onTap: saveInvoice,
                  child: const MyButton(text: "Save Reciept"),),
            )
          ],
        ),
      ),
      bottomNavigationBar: const MyNavBar(index: 2),
    );
  }
}
