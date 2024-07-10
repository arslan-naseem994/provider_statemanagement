// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Viewer',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Images from Directory'),
//         ),
//         body: Center(
//           child: FutureBuilder(
//             future: getImagesFromDirectory(),
//             builder: (BuildContext context, AsyncSnapshot<List<File>> snapshot) {
//               if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
//                 List<File> images = snapshot.data!;
//                 return ListView.builder(
//                   itemCount: images.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Image.file(images[index]);
//                   },
//                 );
//               } else {
//                 return CircularProgressIndicator();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
