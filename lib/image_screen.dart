import 'package:flutter/material.dart';
import 'package:form_validation/gallery.dart';

class ImageScreen extends StatefulWidget {
  Map imageDescription = {};

  ImageScreen({super.key, required this.imageDescription});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Details"),
            backgroundColor: Colors.amber,
            content: Text(
                "ID: ${widget.imageDescription['id']}\nResolution: ${widget.imageDescription['width']}*${widget.imageDescription['height']}\nPhotographer: ${widget.imageDescription['photographer']}\nPhotographer URL: ${widget.imageDescription['photographer_url']}"),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(66, 47, 47, 47),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of((context)).push(
                    MaterialPageRoute(builder: ((context) => const Gallery())));
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text("ID: ${widget.imageDescription['id']}"),
          actions: [
            IconButton(onPressed: _showDialog, icon: const Icon(Icons.info))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 500,
                  child: Image.network(
                    widget.imageDescription['src']['portrait'],
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
