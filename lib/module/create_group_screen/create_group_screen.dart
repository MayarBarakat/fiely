import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:filey/shared/components/components.dart';
import 'package:flutter/material.dart';

class CreateGroupScreen extends StatefulWidget {
  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  var groupNameController = TextEditingController();

  late List<File> files = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Group'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(30.0),
                  color: Colors.white,
                  child: Center(
                      child: Column(children: [
                    const Padding(padding: EdgeInsets.only(top: 140.0)),
                    const Text(
                      'Create New Group',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 50.0)),
                    TextFormField(
                      controller: groupNameController,
                      decoration: InputDecoration(
                        labelText: "Enter Group Name",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Email cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ]))),
              Container(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(allowMultiple: true);

                      if (result != null) {
                         files =
                            result.paths.map((path) => File(path!)).toList();
                         setState(() {

                         });
                      } else {
                        // User canceled the picker
                      }
                    },
                    child: Text('Add Files')),
              ),
              SizedBox(height: 20,),
              if(files != null)
              for(int i = 0;i<files.length;i++)
                Text(files[i].path),
              SizedBox(height: 40,),
              Container(
                height: 50,
                width: 250,
                child: ElevatedButton(
                    onPressed: ()  {
                      //TODO Create Group
                      Navigator.pop(context);
                    },
                    child: Text('Add Files')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
