import 'package:flutter/material.dart';
import 'package:flutter_interview_app/models/photos.dart';
import 'package:flutter_interview_app/services/photo_services.dart';

class MyPhotoPage extends StatefulWidget {
  const MyPhotoPage({Key? key}) : super(key: key);

  @override
  State<MyPhotoPage> createState() => _MyPhotoPageState();
}

class _MyPhotoPageState extends State<MyPhotoPage> {
  late Future<Photos> photoAlbum;

  @override
  void initState() {
    super.initState();
    photoAlbum = getPhotos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
