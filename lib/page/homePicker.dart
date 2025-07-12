import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  File? _image;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80
    );

    setState(() {
      if(pickedFile != null) {
        _image = File(pickedFile.path);
      }
      else {
        print("No Image Picked");
      }
    });
  }

  Future getImageCamera() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80
    );

    setState(() {
      if(pickedFile != null) {
        _image = File(pickedFile.path);
      }
      else {
        print("No Image Picked");
      }
    });
  }


  /*
      Future getImageCamera() async {
        final pickedFile = await picker.pickImage(
            source: ImageSource.camera,
            imageQuality: 80
        );
        */

  /*
      getImageGallery() async{
        final pickedFile = await ImagePicker().pickImage(
            source: ImageSource.gallery,
            imageQuality: 80);
        if(pickedFile != null){
          setState(() {
            _image = File(pickedFile.path);
            print(_image);
          });
        }
      }
       */
  /*
      _getFromCamera() async{
        final pickedFile = await ImagePicker().pickImage(
            source: ImageSource.camera,
            imageQuality: 80);
        if(pickedFile != null){
          setState(() {
            _image = File(pickedFile.path);
            print(_image);
          });
        }
      }
      */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column (
          children: [
            SizedBox(height: 100,),

            InkWell(
              onTap: (){
                getImageGallery();
              },
              child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),

                  child: _image != null
                      ? Image.file(
                    _image!.absolute,
                    fit: BoxFit.cover,
                  )
                      : Center(
                        child: Icon(Icons.add_a_photo_outlined,
                        size: 30),
                  )
              ),
            ),

            SizedBox(height: 20),

            InkWell(
              onTap: (){
                getImageGallery();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueGrey,
                ),
                child: Text("Upload",
                  style: TextStyle(
                  color: Colors.white,
                ),),
              ),
            ),
            SizedBox(height: 20,),

            InkWell(
              onTap: (){
                getImageCamera();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green,
                ),
                child: Text("Upload",
                  style: TextStyle(
                    color: Colors.white,
                  ),),
              ),
            )

          ],
        )

      ),
    );
  }
}

