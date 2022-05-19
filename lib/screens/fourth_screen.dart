import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:projnew/screens/note_screen.dart';
import 'dart:io';
import 'dart:async';

class FourthScreen extends StatefulWidget {
  @override
  State<FourthScreen > createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen > {

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text("Pick your image"),
        ),
        backgroundColor: Color(0xFF90E6FC),
        body: Center(
          child: Column(
            children: [
              MaterialButton(
                  color: Colors.blueAccent,
                  child: const Text(
                      "Pick Image from Gallery",
                      style: TextStyle(
                          color: Colors.white60, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: () {
                    pickImage();
                  }
              ),
              MaterialButton(
                  color: Colors.blueAccent,
                  child: const Text(
                      "Pick Image from Camera",
                      style: TextStyle(
                          color: Colors.white60, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: () {
                    pickImageC();
                  }
              ),
              SizedBox(height: 50),
              image != null ? Image.file(image!) : Text("No image selected")
              ,NotesScreen()
            ],
          ),
        )
    );
   }
  }