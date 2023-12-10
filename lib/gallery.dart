import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_validation/image_screen.dart';
import 'package:form_validation/widgets/custom_drawer.dart';
import 'package:form_validation/api/api_key.dart';
import 'package:http/http.dart' as http;

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  Map imageResult = {};

  /* List<Map<String, dynamic>> listImages = []; */
  List listImages = [];

  @override
  void initState() {
    // TODO: implement initState

    fetchImages();
    /*  fetchDumbImages(); */
    super.initState();
  }

  Future<void> fetchImages() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=21'),
        headers: {'Authorization': pexelApiKey}).then((value) {
      imageResult = jsonDecode(value.body);
      setState(() {
        listImages = imageResult['photos'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text("Gallery"),
          centerTitle: true,
        ),
        body: GridView.builder(
            itemCount: listImages.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return imageContainer(
                imageUrl: listImages[index]['src']['tiny'],
                imageID: listImages[index],
              );
            }));
  }

  Padding imageContainer({required String imageUrl, required Map imageID}) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of((context)).push(MaterialPageRoute(
              builder: ((context) => ImageScreen(
                    imageDescription: imageID,
                  ))));
        },
        child: SizedBox(
          height: 100,
          width: 50,
          child: Image.network(
            imageUrl,
            scale: 1,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
