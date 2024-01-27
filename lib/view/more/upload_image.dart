import 'dart:io';

import 'package:cookinapp_01/common_widget/round_button.dart';
import 'package:cookinapp_01/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  bool loading = false;
  File? _image;
  final picker = ImagePicker();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Users');

  Future getImageGallery() async {
    final PickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    // await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    setState(() {
      if (PickedFile != null) {
        _image = File(PickedFile.path);
      } else {
        Text('no image picked');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('upload image'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  getImageGallery();
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: _image != null
                      ? Image.file(_image!.absolute)
                      : Center(
                          child: Icon(Icons.image),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RoundButton(
              title: 'Upload',
              loading: loading,
              onPressed: () async {
                setState(() {
                  loading = true;
                });

                firebase_storage.Reference ref = firebase_storage
                    .FirebaseStorage.instance
                    .ref('/foldername' + '1224');

                firebase_storage.UploadTask uploadTask =
                    ref.putFile(_image!.absolute);

                Future.value(uploadTask).then((value) async {
                  var newUrl = await ref.getDownloadURL();

                  databaseRef
                      .child('1')
                      .set({'id': '12121', 'image': newUrl.toString()}).then(
                          (value) {
                    setState(() {
                      loading = true;
                    });
                    utils().toastMessage('uploaded');
                  }).onError((error, StackTrace) {
                    setState(() {
                      loading = false;
                    });
                  });
                }).onError((error, StackTrace) {
                  utils().toastMessage(error.toString());
                });
                setState(() {
                  loading = false;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
