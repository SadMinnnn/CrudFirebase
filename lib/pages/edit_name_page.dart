import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});
  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map? arguments = ModalRoute.of(context)?.settings.arguments as Map?;

    if (arguments != null) {
      nameController.text = arguments['name'] ?? '';
      ageController.text = arguments['age'] ?? '';
      idController.text = arguments['id'] ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Actualizar el nombre',
              ),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Actualizar la edad',
              ),
            ),
            TextField(
              controller: idController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Actualizar el ID',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (arguments != null) {
                  await updateEstudiantes(
                    arguments['uid'],
                    nameController.text,
                    ageController.text,
                    idController.text,
                  ).then((_) {
                    Navigator.pop(context);
                  });
                }
              },
              child: const Text("Actualizar"),
            ),
          ],
        ),
      ),
    );
  }
}

























// import 'package:flutter/material.dart';

// import '../services/firebase_service.dart';
// // import 'package:crud/services/firebase_service.dart';

// class EditNamePage extends StatefulWidget {
//   const EditNamePage({super.key});
//   @override
//   State<EditNamePage> createState() => _EditNamePageState();
// }

// class _EditNamePageState extends State<EditNamePage> {
//   TextEditingController nameController = TextEditingController(text: "");

//   @override
//   Widget build(BuildContext context) {
//     Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
//     nameController.text = arguments['name'];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Name'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(
//                 hintText: 'Actualice el nombre',
//               ),
//             ),
//             Text(
//               arguments['uid'],
//               style: const TextStyle(fontSize: 10),
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   await updateEstudiantes(arguments['uid'], nameController.text)
//                       .then((_) {
//                     Navigator.pop(context);
//                   });
//                 },
//                 child: const Text("Actualizar"))
//           ],
//         ),
//       ),
//     );
//   }
// }
