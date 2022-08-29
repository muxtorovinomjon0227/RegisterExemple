import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register_app/RegisterExemple/registor_page.dart';

import 'WievModel/view_model.dart';

class RegisterHomePage extends StatelessWidget {
   RegisterHomePage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _loginTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _providerWork = Provider.of<CounterViewModel>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
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
            const Text("Login now to track all your expenses and income at a place!"),
            const SizedBox(height: 50),
            const Text("Phone",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _loginTextController,
                   keyboardType: TextInputType.phone,
                    decoration:  InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle),
                      hintText: "Ex: +998 99 495 8186",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onSaved: (String? value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty || _loginTextController.text.length<13 || !_loginTextController.text.startsWith("+")) {
                        return 'Iltimos telfon raqamni kiriting';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: (){
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tabriklaymiz siz ro\'yxotdan o\'tdingiz'))
                  );
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>   RegisterPage()));
                }
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text("Login",style: TextStyle(color: Colors.white),)),
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
