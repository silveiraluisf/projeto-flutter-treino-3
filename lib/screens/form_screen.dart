import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Activity'),
      ),
      body: Center(
        child: Container(
          height: 550,
          width: 375,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 3),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: difficultyController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Difficulty',
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: imageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Image',
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(nameController.text);
                    print(int.parse(difficultyController.text));
                    print(imageController.text);
                  },
                  child: const Text('Add'))
            ],
          ),
        ),
      ),
    );
  }
}
