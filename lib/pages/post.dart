import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/user_m_1.dart';
import '../service/service.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _subController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: "name"),
          ),
          TextField(
            controller: _subController,
            decoration: InputDecoration(hintText: "Description"),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
              controller: _priceController,
              decoration: InputDecoration(hintText: "prise"),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              submitData();
            },
            child: const Text("Post"),
          )
        ],
      ),
    ));
  }

  Future<void> submitData() async {
    log('1');

    var user = Datum(
      productName: _nameController.text,
      productDescription: _subController.text,
      productPrice: _priceController.text,
    );
    print(user);

    log(user.toString());
    var response = await ApiServices().post(user).catchError((err) {});
    if (response == null) return;
    log('successful:');
    debugPrint('successful:');
  }
}
