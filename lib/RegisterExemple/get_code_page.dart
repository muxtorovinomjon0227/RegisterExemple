import 'package:flutter/material.dart';
import 'package:register_app/RegisterExemple/view_users.dart';

class GetCodePage extends StatelessWidget {
  String userName;
  String userPhone;

  GetCodePage({Key? key, required this.userName, required this.userPhone})
      : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _codeTextController = TextEditingController();

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
              "Login",
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            const Text(
                "We have sent a code to your phone account with a verification code!"),
            const SizedBox(height: 50),
            const Text(
              "Verification Code",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _codeTextController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle),
                      hintText: "Ex: 0000",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onSaved: (String? value) {},
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          _codeTextController.text.length < 4) {
                        return 'Iltimos codni kiriting';
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
                      builder: (context) => ViewUsersPage(
                            userName: userName,
                            userPhone: userPhone,
                            userCode: _codeTextController.text,
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
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
