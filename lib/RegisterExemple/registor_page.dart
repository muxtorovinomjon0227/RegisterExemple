import 'package:flutter/material.dart';

import 'get_code_page.dart';
import 'home_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _registerTextController = TextEditingController();
  final _registerNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.black87,
              ),
            ),
            const Text(
              "Register",
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            const Text("Create an account to access all the features of MyFi!"),
            const SizedBox(height: 50),
            const Text(
              "Phone number",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _registerTextController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle),
                      hintText: "Ex: +998 99 495 8186",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onSaved: (String? value) {},
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          _registerTextController.text.length < 13 ||
                          !_registerTextController.text.startsWith("+")) {
                        return 'Iltimos telfon raqamni kiriting';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Your name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _registerNameTextController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle),
                      hintText: "Ex. Saul Ramirez",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onSaved: (String? value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Iltimos ismingizni kiriting';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text('Tabriklaymiz siz ro\'yxotdan o\'tdingiz')));
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GetCodePage(
                            userPhone: _registerTextController.text,
                            userName: _registerNameTextController.text,
                          )));
                }
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                    child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Already have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterHomePage()));
                    },
                    child: const Text("Login"))
              ],
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
