import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Modals/user_model.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  
  List<UserModel> userList = [];
   Future<List<UserModel>> getUserApi()async{
   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users')) ;
   var data = jsonDecode(response.body.toString());
   if(response.statusCode == 200){
  for(Map i in data){
    print(i['name']);
    userList.add(UserModel.fromJson(i));
  }

     return userList;
   }else{
     return userList;
   }
   }
     

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course 2'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUserApi(),
               builder: (context, AsyncSnapshot<List<UserModel>>snapshot) {
                  if(!snapshot.hasData){
                    return CircularProgressIndicator();
                  }else{
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context,index) {

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text('Name'),
                            Text(snapshot.data![index].name.toString()),
                        ],
                      ),
                      ReusableRow(title: 'name', value: snapshot.data![index].name.toString()),
                      ReusableRow(title: 'username', value: snapshot.data![index].username.toString()),
                      ReusableRow(title: 'email', value: snapshot.data![index].email.toString()),
                    ],
                              ),
                            ),
                          );
                        });
                  }

               } ,
              ),
          )
        ],
      ),
    );
  }
}


class ReusableRow extends StatelessWidget {
  String title , value;
   ReusableRow({Key? key , required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding
      (
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
