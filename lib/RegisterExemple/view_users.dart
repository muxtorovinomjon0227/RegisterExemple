import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewUsersPage extends StatelessWidget {
  String userPhone;
  String userName;
  String userCode;
   ViewUsersPage({Key? key, required this.userPhone,required this.userName,required this.userCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Foydalanuvchilar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
            itemBuilder: (BuildContext ctx, int index){
          return Card(
            elevation: 2,
            child: ListTile(
              leading: const Text("👨‍💻",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              title: Text(userName),
              subtitle:  Text(userPhone),
              trailing: Text(userCode),
            ),
          );
        }),
      ),
    );
  }
}
