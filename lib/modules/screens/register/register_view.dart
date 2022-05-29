// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:auth_my_exemple/modules/users/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  FormGroup buildform() => fb.group(
        <String, Object>{
          'name': FormControl<String>(
            validators: [Validators.required],
          ),
          'email': FormControl<String>(
            validators: [Validators.required, Validators.email],
          ),
          'phoneNumber': FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          'password': FormControl<String>(
            validators: [
              Validators.required,
              Validators.minLength(8),
            ],
          ),
          'passwordConfirmation': FormControl<String>(),
        },
        [
          Validators.mustMatch('password', 'passwordConfirmation'),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Created account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: ReactiveFormBuilder(
            form: buildform,
            builder: (context, form, child) {
              return Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReactiveTextField(
                      formControlName: 'name',
                      validationMessages: (Control) => {
                        ValidationMessage.required: 'O nome não pode estar vazio'
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full name',
                        helperText: '',
                        helperStyle: TextStyle(height: 0.7),
                        errorStyle: TextStyle(height: 0.7),
                      ),
                    ),
                    //
                    SizedBox(height: 16.0),
                    //
                    ReactiveTextField<String>(
                      formControlName: 'email',
                      validationMessages: (Control) => {
                        ValidationMessage.required:
                            "O e-mail não pode está vazio",
                        ValidationMessage.email: "O e-mail deve ser válido",
                        'unique': 'Esse e-mail já está em uso',
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                        helperText: '',
                        helperStyle: TextStyle(height: 0.7),
                        errorStyle: TextStyle(height: 0.7),
                      ),
                    ),
                    //
                    SizedBox(height: 16.0),
                    //
                    ReactiveTextField(
                      formControlName: 'phoneNumber',
                      validationMessages: (Control) => {
                        ValidationMessage.required: 'O nome não pode estar vazio'
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'PhoneNumber',
                        helperText: '',
                        helperStyle: TextStyle(height: 0.7),
                        errorStyle: TextStyle(height: 0.7),
                      ),
                    ),
                    //
                    //
                    SizedBox(height: 16.0),
                    //
                    //
                    ReactiveTextField<String>(
                      formControlName: 'password',
                      validationMessages: (Control) => {
                        ValidationMessage.required: 'A senha não pode está vazia',
                        ValidationMessage.minLength:
                            'A senha deve ter no minímo 8 caracteres',
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                        helperText: '',
                        helperStyle: TextStyle(height: 0.7),
                        errorStyle: TextStyle(height: 0.7),
                      ),
                    ),
                    //
                    SizedBox(height: 16.0),
                    //
                    ReactiveTextField<String>(
                      formControlName: 'passwordConfirmation',
                      validationMessages: (Control) => {
                        ValidationMessage.mustMatch: 'A senha deve corresponder'
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirmação da senha',
                        helperText: '',
                        helperStyle: TextStyle(height: 0.7),
                        errorStyle: TextStyle(height: 0.7),
                      ),
                    ),

                    //
                    SizedBox(height: 16.0),
                    //
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          var cred = await UserController.to.signInWithCredential(
                            EmailAuthProvider.credential(
                              email: form.value['email'].toString(),
                              password: form.value['password'].toString(),
                            ),
                          );
                            print;
                          if (cred.additionalUserInfo!.isNewUser) {
                            UserController.to.userCreate(cred.user!);
                          }
                          once(UserController.to.$user, (user) {
                            if (user != null) {
                              Get.offAllNamed('/explorer');
                            }
                          });
                        } on FirebaseAuthException catch (e) {
                          print(e);
                          Get.snackbar(
                            'Error',
                            e.message!,
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 3),
                            backgroundColor: Colors.redAccent,
                          );
                        }
                        // if (form.valid) {
                        //   UserController.auth.createUserWithEmailAndPassword(
                        //       email: form.value['email'].toString(),
                        //       password: form.value['password'].toString(),
                        //       );
                        //   Get.offAllNamed('/Explorer');
                        // } else {
                        //   form.markAllAsTouched();
                        // }
                      },
                      child: const Text('Created Account'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
