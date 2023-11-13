import 'package:flutter/material.dart';
import 'package:flutter1/services/firebase_service.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});
  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el nuevo nombre',
              ),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number, // Teclado numérico para la edad
              decoration: const InputDecoration(
                hintText: 'Ingrese la edad',
              ),
            ),
            TextField(
              controller: idController,
              keyboardType: TextInputType.number, // Teclado alfanumérico para el ID
              decoration: const InputDecoration(
                hintText: 'Ingrese el ID',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await addEstudiantes(
                  nameController.text,
                  ageController.text,
                  idController.text,
                ).then((_) {
                  Navigator.pushReplacementNamed(context, '/');
                });
              },
              child: const Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}




















// import 'package:flutter/material.dart';
// import 'package:flutter1/services/firebase_service.dart';

// class AddNamePage extends StatefulWidget {
//   const AddNamePage({super.key});
//   @override
//   State<AddNamePage> createState() => _AddNamePageState();
// }

// class _AddNamePageState extends State<AddNamePage> {
//   TextEditingController nameController = TextEditingController(text: "");

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Name'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(
//                 hintText: 'Ingrese el nuevo nombre',
//               ),
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   await addEstudiantes(nameController.text).then((_) {
//                     Navigator.pushReplacementNamed(context, '/');
//                     // Navigator.pop(context);
//                   });
//                 },
//                 child: const Text("Guardar"))
//           ],
//         ),
//       ),
//     );
//   }
// }
