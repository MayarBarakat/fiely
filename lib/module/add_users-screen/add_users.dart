import 'package:flutter/material.dart';

class AddUsers extends StatelessWidget {
  const AddUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Users'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: ListView.separated(
              itemBuilder: (context,index){
                return Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                border: Border.all()),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: const EdgeInsets.only(right: 12.0),

                      child: IconButton(
                        icon: const Icon(Icons.supervised_user_circle,
                            color: Colors.green),
                        onPressed: () {
                        },
                      ),
                    ),
                    title: const Text(
                      "Name Of user",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    trailing: IconButton(
                      icon: Icon(Icons.add,
                          color: Colors.blue, size: 30.0),
                      onPressed: () {
                        //TODO when user added reload the screen
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (context,index){
               return SizedBox(height: 12,);
              },
              itemCount: 12,
          ),
        ),
      ),
    );
  }
}
