import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multi_store_admin/views/side_screens/widgets/category_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'CategoriesScreen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreen();
}

class _CategoriesScreen extends State<CategoriesScreen> {
  dynamic _image;
  String? _fileName;
  late String _categoryName;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
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

  Future<String> _uploadToFirebaseStorage(dynamic categoryImage) async {
    var ref = _firebaseStorage.ref().child('category').child(_fileName!);

    UploadTask uploadTask = ref.putData(categoryImage);
    TaskSnapshot taskSnapshot = await uploadTask;
    taskSnapshot.ref
        .getDownloadURL()
        .then((value) => debugPrint('Done: $value'));
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    debugPrint('URL: $downloadURL');
    return downloadURL;
  }

  _uploadToFirebaseStore() async {
    if (!_formKey.currentState!.validate()) return;

    EasyLoading.show(status: 'Uploading category...');

    if (_image == null) {
      EasyLoading.dismiss();
      EasyLoading.showError('Please select category image');
      return;
    }

    var imageUrl = await _uploadToFirebaseStorage(_image);

    await _firebaseFirestore
        .collection('category')
        .doc(_fileName)
        .set({'image': imageUrl, 'name': _categoryName}).whenComplete(() {
      EasyLoading.showSuccess('category uploaded successfully!');
      EasyLoading.dismiss();
      setState(() {
        _image = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Upload category',
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
                          : const Text('Upload category image')),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 500,
                      child: TextFormField(
                        onChanged: (value) => {
                          setState(() {
                            _categoryName = value;
                          })
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter category name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Category name',
                          hintText: 'Enter category name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        _uploadToFirebaseStore();
                      },
                      child: const Text('Save category'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                pickImage();
              },
              child: const Text('Select category'),
            ),
            const CategoryWidget(),
          ],
        ),
      ),
    ));
  }
}
