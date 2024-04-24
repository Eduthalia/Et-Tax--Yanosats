import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStoreServices {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference customers =
      FirebaseFirestore.instance.collection("customers");

  final CollectionReference invoice =
      FirebaseFirestore.instance.collection("invoice");

  Future<void> addCustomer(String name, String tin, String income, String vat) {
    return customers.add({
      "name": name,
      'tin': tin,
      'income': income,
      'vat': vat,
      'timestamo': Timestamp.now()
    });
  }

  Future<void> addInvoice(String name, String tin, String date,
      String unitPrice, String amount, String totalPrice, String vat) {
    return invoice.add({
      "name": name,
      'tin': tin,
      'totalPrice': totalPrice,
      'unitPrice': unitPrice,
      'date': date,
      'amount': amount,
      'vat': vat
    });
  }

  Stream<QuerySnapshot> getCustomers() {
    final customerStream =
        customers.orderBy('timestamp', descending: true).snapshots();
    return customerStream;
  }

  Stream<QuerySnapshot> getInvoice() {
    final invoiceStream =
        invoice.orderBy('timestamp', descending: true).snapshots();
    return invoiceStream;
  }

  Future<void> updateNote(String tin, String name, String income, String vat) {
    return customers.doc(tin).update({
      "name": name,
      'tin': tin,
      'income': income,
      'vat': vat,
      'timestamp': Timestamp.now()
    });
  }

  Future<void> deleteCustomer(String tin) {
    return customers.doc(tin).delete();
  }

  Future<String> addInvoiceImage(String name, Uint8List file) async {
    Reference ref = storage.ref().child(name);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downlaodUrl = await taskSnapshot.ref.getDownloadURL();
    return downlaodUrl;
  }

  Future<String> saveInvoiceImage(
      String name, Uint8List file, String tin) async {
    String resp = "Some Error Happended!";
    try {
      String imageUrl = await addInvoiceImage("invoiceImage", file);
      await firestore.collection("clientInvoice").add({
        'name': name,
        'tin': tin,
        'imageUrl': imageUrl,
        'timestamp': Timestamp.now()
      });
      resp = "Success!";
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
  //late CollectionReference notesDynamic;
  //get data from the firestore
  // initializeDatabase(String name) {
  //   notesDynamic = FirebaseFirestore.instance.collection(name);
  // }

  // final CollectionReference notes2 =
  //     FirebaseFirestore.instance.collection("users");

  //Create: add note to the fire store

  // Future<void> addDynaic(
  //     String venterId, String venterEmail, int price, String message) {
  //   return notesDynamic.add({
  //     "venterId": venterId,
  //     'venterEmail': venterEmail,
  //     'ventMessage': message,
  //     'timestamp': Timestamp.now()
  //   });
  // }

  // Future<void> addTry(
  //   String imageName,
  // ) {
  //   return notes.add({"note": imageName, 'timestamp': Timestamp.now()});
  // }

  //Retrive: brings up note from the fire store

  // Stream<QuerySnapshot> getUsers() {
  //   final notesStream =
  //       notes2.orderBy('timestamp', descending: true).snapshots();
  //   return notesStream;
  // }

  // Stream<QuerySnapshot> getNotesDynamic() {
  //   final notesStream =
  //       notesDynamic.orderBy('timestamp', descending: true).snapshots();
  //   return notesStream;
  // }

  //Update: edit notes with a provided doc id

  // Future<void> updateNoteDynamic(String docId, String imageName, String name,
  //     String price, String description) {
  //   return notesDynamic.doc(docId).update({
  //     'imageName': imageName,
  //     'name': name,
  //     'price': price,
  //     'discription': description,
  //     'timestamp': Timestamp.now()
  //   });
  // }

  // Future<void> updateNoteTry(
  //   String docId,
  //   String imageName,
  // ) {
  //   return notes.doc(docId).update({
  //     'note': imageName,
  //     // 'name': name,
  //     // 'price': price,
  //     // 'discription': description,
  //     // 'timestamp': Timestamp.now()
  //   });
  // }

  //Delete: delete notes with a provided doc id

  // Future<void> deleteNoteDynamic(String docID) {
  //   return notesDynamic.doc(docID).delete();
  // }

  // Future<String?> searchUserUIDByEmail(String email) async {
  //   try {
  //     // Create a reference to the Firestore collection
  //     CollectionReference users =
  //         FirebaseFirestore.instance.collection('users');

  //     // Query for documents where the email field matches the provided email
  //     QuerySnapshot querySnapshot =
  //         await users.where('email', isEqualTo: email).get();

  //     // Check if any documents were found
  //     if (querySnapshot.docs.isNotEmpty) {
  //       // Get the first document (assuming emails are unique)
  //       DocumentSnapshot userDoc = querySnapshot.docs.first;

  //       // Retrieve the UID from the document
  //       String? uid = userDoc.get(
  //           'verificationCode'); // Replace 'UID' with the actual field name in your Firestore document

  //       // Return the UID
  //       return uid;
  //     } else {
  //       // No matching document found
  //       return null;
  //     }
  //   } catch (e) {
  //     // Handle any errors
  //     print('Error searching user UID by email: $e');
  //     return null;
  //   }
  // }
}
