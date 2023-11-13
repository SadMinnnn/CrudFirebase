import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getEstudiantes() async {
  List estudiantes = [];
  QuerySnapshot querySnapshot = await db.collection('Estudiantes').get();
  for (var doc in querySnapshot.docs) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    Map person = {
      "name": data["name"],
      "uid": doc.id,
    };

    estudiantes.add(person);
  }
  return estudiantes;
}

// Guardar un name en base de datos
Future<void> addEstudiantes(String name) async {
  await db.collection("Estudiantes").add({"name": name});
}

// Actualizar un name en base de datos
Future<void> updateEstudiantes(String uid, String name) async {
  await db.collection("Estudiantes").doc(uid).set({"name": name});
}

// Borrar datos de Firebase
Future<void> deleteEstudiantes(String uid) async {
  await db.collection("Estudiantes").doc(uid).delete();
}
