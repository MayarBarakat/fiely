import 'package:flutter/material.dart';

class UploadedFiles extends StatelessWidget {
  const UploadedFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploaded Files'),
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
                        icon: const Icon(Icons.file_copy_sharp,
                            color: Colors.green),
                        onPressed: () {
                        },
                      ),
                    ),
                    title: const Text(
                      "Name Of File",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Booked Up", style: TextStyle(color: Colors.red)),


                  ),
                );
              },
              separatorBuilder: (context,index){
                return SizedBox(height: 12,);
              },
              itemCount: 12,
            )
        ),
      ),
    );
  }
}
