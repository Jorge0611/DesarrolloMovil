import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final _fireStore = FirebaseFirestore.instance;

  final List _bannerList = [];

  getBanner() {
    return _fireStore
        .collection('banner')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                setState(() {
                  _bannerList.add(doc.data());
                });
              })
            });
  }

  @override
  void initState() {
    super.initState();
    getBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: PageView.builder(
        itemBuilder: (context, index) {
          return ClipRRect(
            child: Image(
              image: NetworkImage(_bannerList[index]['image']),
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: _bannerList.length,
      ),
    );
  }
}
