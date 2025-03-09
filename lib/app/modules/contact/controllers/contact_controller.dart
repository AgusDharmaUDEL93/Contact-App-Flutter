import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../data/contact.dart';

class ContactController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final RxList<Contact> contacts = <Contact>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (_auth.currentUser != null) {
      fetchContacts();
    }
  }

  void fetchContacts() {
    final user = _auth.currentUser;
    if (user == null) {
      print("User not logged in");
      return;
    }

    _firestore
        .collection("users")
        .doc(user.uid)
        .collection("contacts")
        .snapshots()
        .listen((snapshot) {
          contacts.assignAll(
            snapshot.docs.map((doc) {
              var data = doc.data();
              return Contact(
                id: doc.id,
                name: data["name"],
                phone: data["phone"],
              );
            }),
          );
        });
  }

  void deleteContact(String contactId) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _firestore
        .collection("users")
        .doc(user.uid)
        .collection("contacts")
        .doc(contactId)
        .delete();
  }
}
