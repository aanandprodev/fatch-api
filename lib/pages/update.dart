import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/user_m_1.dart';
import '../service/service.dart';

class UpatePage extends StatefulWidget {
  final dynamic? id;
  final dynamic? price;
  final String? name;
  final String? dri;

  UpatePage({Key? key, this.id, this.price, this.name, this.dri})
      : super(key: key);

  @override
  _UpatePageState createState() => _UpatePageState();
}

class _UpatePageState extends State<UpatePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _subController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    log(widget.name.toString());

    _nameController.text = widget.name.toString();
    _subController.text = widget.dri.toString();
    _priceController.text = widget.price.toString();
  }

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
              update();
            },
            child: const Text("Post"),
          )
        ],
      ),
    ));
  }

  Future<void> update() async {
    log('1');

    var user = Datum(
      id: widget.id,
      productName: _nameController.text,
      productDescription: _subController.text,
      productPrice: _priceController.text,
    );

    log(user.toString());

    var response =
        await ApiServices().putAPI("/${user.id}", user).catchError((err) {});
    if (response == null) return;
    debugPrint('successful:');
  }
}
