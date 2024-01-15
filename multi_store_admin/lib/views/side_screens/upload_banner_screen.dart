import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UploadBannerScreen extends StatefulWidget {
  const UploadBannerScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'UploadBannerScreen';

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreen();
}

class _UploadBannerScreen extends State<UploadBannerScreen> {
  dynamic _image;
  String? _fileName;

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      //allowedExtensions: ['jpg', 'png', 'jpeg'],
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        _fileName = result.files.first.name;
      });
    } else {
      debugPrint('No image selected.');
    }
  }

  Future<String> _uploadToFirebaseStorage(dynamic bannerImage) async {
    var ref = _firebaseStorage.ref().child('banner').child(_fileName!);

    UploadTask uploadTask = ref.putData(bannerImage);
    TaskSnapshot taskSnapshot = await uploadTask;
    taskSnapshot.ref
        .getDownloadURL()
        .then((value) => debugPrint('Done: $value'));
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    debugPrint('URL: $downloadURL');
    return downloadURL;
  }

  _uploadToFirebaseStore() async {
    EasyLoading.show(status: 'Uploading banner...');
    if (_image != null) {
      var imageUrl = await _uploadToFirebaseStorage(_image);

      await _firebaseFirestore
          .collection('banner')
          .doc(_fileName)
          .set({'image': imageUrl}).whenComplete(() {
        EasyLoading.showSuccess('Banner uploaded successfully!');
        EasyLoading.dismiss();
        setState(() {
          _image = null;
        });
      });
    } else {
      EasyLoading.dismiss();
      debugPrint('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Upload Banner',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                child: Center(
                    child: _image != null
                        ? Image.memory(_image, fit: BoxFit.cover)
                        : const Text('Upload banner')),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  _uploadToFirebaseStore();
                },
                child: const Text('Save banner'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              pickImage();
            },
            child: const Text('Select banner'),
          ),
        ],
      ),
    ));
  }
}
