import 'package:auth_my_exemple/modules/users/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginView extends StatelessWidget  {
  const LoginView({Key? key}) : super(key: key);

  FormGroup buildform() => fb.group(<String, Object>{
        'email': FormControl<String>(
          validators: [Validators.required, Validators.email],
        ),
        'password': [
          '',
          Validators.required,
          Validators.minLength(8),
        ],
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Sign in'),
      ),
      body: Center(
        child: ReactiveFormBuilder(
          form: buildform,
          builder: (context, form, child) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReactiveTextField<String>(
                    formControlName: 'email',
                    validationMessages: (control) => {
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
                  const SizedBox(
                    height: 14.0,
                  ),
                  //
                  ReactiveTextField<String>(
                    formControlName: 'password',
                    obscureText: true,
                    validationMessages: (control) => {
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
                  const SizedBox(height: 16.0),
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

                        if (cred.additionalUserInfo!.isNewUser) {
                          UserController.to.userCreate(cred.user!);
                        }
                        Get.offAllNamed('/explorer');
                        once(UserController.to.$user, (user) {
                          if (user != null) {}
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
                    },
                    child: const Text('Sign in'),
                  ),
                  //
                  const SizedBox(height: 18.0),
                  //
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/register');
                    },
                    child: const Text('Register'),
                  ),
                  //
                  const SizedBox(height: 18.0),
                  //
                  // ElevatedButton(
                  //     onPressed: () {
                  //       auth.signInAnonymously();
                  //     },
                  //     child: const Text('Guest')),
                  // //
                  // SizedBox(height: 18.0),
                  // //
                  TextButton(
                      onPressed: () {},
                      child: const Text('Forgot your password?')),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
