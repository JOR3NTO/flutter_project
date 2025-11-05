import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/universidad.dart';

class UniversidadService {
  Future<void> deleteUniversidad(String id) async {
    await _collection.doc(id).delete();
  }
  final _collection = FirebaseFirestore.instance.collection('universidades');

  Stream<List<Universidad>> getUniversidadesStream() {
    return _collection.snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Universidad.fromMap(doc.data(), doc.id)).toList()
    );
  }

  Future<void> addUniversidad(Universidad universidad) async {
    await _collection.add(universidad.toMap());
  }
}
