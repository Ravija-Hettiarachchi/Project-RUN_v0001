import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../models/bus_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Initialize Firebase
  static Future<void> initialize() async {
    await Firebase.initializeApp();
  }

  // User operations
  Future<void> saveUser(UserModel user) async {
    await _firestore.collection('users').doc(user.id).set(user.toMap());
  }

  Future<UserModel?> getUser(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data()!, doc.id);
    }
    return null;
  }

  // Bus operations
  Stream<List<Bus>> getBusStream() {
    return _firestore
        .collection('buses')
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Bus.fromMap(doc.data(), doc.id))
            .toList());
  }

  Future<List<Bus>> getActiveBuses() async {
    final snapshot = await _firestore
        .collection('buses')
        .where('isActive', isEqualTo: true)
        .get();
    
    return snapshot.docs
        .map((doc) => Bus.fromMap(doc.data(), doc.id))
        .toList();
  }

  // Save bus position
  Future<void> updateBusPosition(String busId, double lat, double lon) async {
    await _firestore.collection('buses').doc(busId).update({
      'latitude': lat,
      'longitude': lon,
      'lastUpdated': FieldValue.serverTimestamp(),
    });
  }
}

