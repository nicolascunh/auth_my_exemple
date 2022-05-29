import 'package:auth_my_exemple/modules/screens/products/products_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../model/Demo_Products.dart';

class ProductsForm extends GetView<ProductsController> {
  final products = <DemoProduct>[].obs;

  FormGroup buildform() => fb.group(<String, Object>{
        'title': FormControl<String>(validators: [Validators.required]),
        'description': FormControl<String>(validators: [Validators.required]),
        'location': FormControl<String>(validators: [Validators.required])
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Products Form'),
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          ReactiveFormBuilder(
            form: buildform,
            builder: (context, form, child) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReactiveTextField(
                      formControlName: 'title',
                      validationMessages: (control) => {
                        ValidationMessage.required: 'The title cannot be empty',
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        labelText: 'Title',
                        helperText: '',
                        helperStyle: TextStyle(height: 0.7),
                        errorStyle: TextStyle(height: 0.7),
                      ),
                    ),
                    //
                    SizedBox(height: 16.0),
                    //
                    ReactiveTextField(
                      formControlName: 'description',
                      validationMessages: (control) => {
                        ValidationMessage.required:
                            'The description cannot be empty',
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        labelText: 'Description',
                        helperText: '',
                        helperStyle: TextStyle(height: 0.7),
                        errorStyle: TextStyle(height: 0.7),
                      ),
                    ),
                    //
                    SizedBox(height: 16.0),
                    //
                    ReactiveTextField(
                      formControlName: 'location',
                      validationMessages: (control) => {
                        ValidationMessage.required: 'location must be defined',
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        labelText: 'Location',
                        helperText: '',
                        helperStyle: TextStyle(height: 0.7),
                        errorStyle: TextStyle(height: 0.7),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          form.markAllAsTouched();

                          if (form.valid) {
                            controller.addProduct(
                              title: form.value['title'].toString(),
                              description: form.value['description'].toString(),
                              location: form.value['location'].toString(),
                            );
                            Get.back();
                          }
                        },
                        child: Text('Send')),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
