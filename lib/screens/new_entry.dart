import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class NewEntryScreen extends StatefulWidget {
  final XFile image;

  const NewEntryScreen({super.key, required this.image});

  @override
  State<NewEntryScreen> createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Wasteagram')),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0),
          child: Builder(
            builder: (context) => _renderForm(context),
          ),
        ),
    );
  }

  Widget _renderForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FittedBox(
            fit: BoxFit.fill,
            child: Image.file(File(widget.image.path)),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(
              label: Center(child: Text('Number of Items'))
            ),
            validator:(value) {
              if (value == null || value.isEmpty) {
                return 'please enter a quantity';
              }
              return null;
            },
            onSaved: (value) => setState(() => _quantity = value),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton.icon(
                onPressed:() {
                  final form = _formKey.currentState;
                  if (form != null && form.validate()) {
                    form.save();
                    // save to Firebase
                  }
                },
                icon: const Icon(Icons.cloud_upload),
                label: const Text('Save')
              ),
            ),
          )
        ],
      )
    );
  }
}