import 'package:flutter/material.dart';
import 'package:flutter_interview_app/models/photos.dart';
import 'package:flutter_interview_app/services/photo_services.dart';

class MyPhotoPage extends StatefulWidget {
  const MyPhotoPage({Key? key}) : super(key: key);

  @override
  State<MyPhotoPage> createState() => _MyPhotoPageState();
}

class _MyPhotoPageState extends State<MyPhotoPage> {
  List<Photos> _photos = [];
  final PhotosService _photoService = PhotosService();

  @override
  void initState() {
    super.initState();
    _getPhotos();
  }
  Future<void> _getPhotos() async {
    try {
      final photos = await _photoService.getPhotos();
      setState(() {
        _photos = photos;
      });
    } catch (e) {
      print('Could not get photos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: SafeArea(
          child: _photos.isNotEmpty
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: _photos.length,
                    itemBuilder: (context, index) {
                      final photo = _photos[index];
                      return GridTile(
                        footer: GridTileBar(
                          backgroundColor: Colors.amberAccent,
                          title: Text(
                            photo.title,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        child: Image.network(
                          photo.thumbnailUrl,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
              )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
