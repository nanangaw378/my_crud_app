import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to add an item to Firestore
  static Future<void> addItem(String name, int age) async {
    try {
      await _db.collection('items').add({
        'name': name,
        'age': age,
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error adding item: $e');
      rethrow; // Optionally, rethrow the error after logging it
    }
  }

  // Function to get all items from Firestore
  static Future<List<Map<String, dynamic>>> getItems() async {
    try {
      final querySnapshot = await _db.collection('items').get();
      return querySnapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'name': doc['name'],
          'age': doc['age'],
        };
      }).toList();
    } catch (e) {
      print('Error getting items: $e');
      rethrow; // Optionally, rethrow the error after logging it
    }
  }

  // Function to delete an item from Firestore by ID
  static Future<void> deleteItem(String id) async {
    try {
      await _db.collection('items').doc(id).delete();
    } catch (e) {
      print('Error deleting item: $e');
      rethrow; // Optionally, rethrow the error after logging it
    }
  }

  // Function to update an item in Firestore by ID
  static Future<void> updateItem(String id, String newName, int newAge) async {
    try {
      await _db.collection('items').doc(id).update({
        'name': newName,
        'age': newAge,
      });
    } catch (e) {
      print('Error updating item: $e');
      rethrow; // Optionally, rethrow the error after logging it
    }
  }
}
