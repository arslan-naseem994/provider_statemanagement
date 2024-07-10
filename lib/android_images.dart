import 'package:flutter/material.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class AndroidImageScreen extends StatefulWidget {
  const AndroidImageScreen({super.key});

  @override
  State<AndroidImageScreen> createState() => _AndroidImageScreenState();
}

class _AndroidImageScreenState extends State<AndroidImageScreen> {
  @override
  void initState() {
    super.initState();
    requestStoragePermission();
  }

  Future<void> requestStoragePermission() async {
    final PermissionStatus status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      // Permission granted, proceed with accessing storage
      setState(() {}); // Refresh UI after permission is granted
    } else {
      // Permission denied, handle accordingly
      print('Permission denied to access storage.');
    }
  }

  Future<List<File>> getImagesFromDirectory() async {
    List<File> imagesList = [];
    Directory directory = Directory('/storage/emulated/0/Android/images/');
    try {
      if (directory.existsSync()) {
        List<FileSystemEntity> files = directory.listSync();
        for (var file in files) {
          if (file is File && file.path.endsWith('.jpg')) {
            imagesList.add(file); // Add 'file' to imagesList
          }
        }
      } else {
        print('Directory does not exist or cannot be accessed.');
      }
    } catch (e) {
      print('Error accessing directory: $e');
    }
    return imagesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Android Images'),
      ),
      body: FutureBuilder(
        future: getImagesFromDirectory(),
        builder: (BuildContext context, AsyncSnapshot<List<File>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            List<File> images = snapshot.data!;
            if (images.isNotEmpty) {
              return ListView.builder(
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.file(images[index]);
                },
              );
            } else {
              return const Center(
                child: Text('No images found.'),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading images: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
