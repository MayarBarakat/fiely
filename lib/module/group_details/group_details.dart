import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:filey/module/add_users-screen/add_users.dart';
import 'package:filey/module/delete_users_screen/delete_users.dart';
import 'package:filey/module/file_details/file_details.dart';
import 'package:filey/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupDetails extends StatelessWidget {
  const GroupDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Group Name: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          'Sports',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Group Owner: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          'Mayar',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Created At: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '2022',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Number Of Files: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '12',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                      if (result != null) {
                        File file = File(result.files.single.path!);
                      } else {
                        // User canceled the picker
                      }
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15))),
                    child: Text('Add File')),
                ElevatedButton(
                    onPressed: ()  {
                      navigateTo(context, const AddUsers());
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15))),
                    child: Text('Add Users')),
                ElevatedButton(
                    onPressed: ()  {
                      navigateTo(context, const DeleteUsers());
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15))),
                    child: const Text('Delete Users')),
              ],
            ),

            const Divider(thickness: 5, color: Colors.red, height: 30),
            buildGroupFiles(),
            ElevatedButton(
                onPressed: ()  {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          title: Text(
                            'Delete Group',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.red[400]),
                          ),
                          message: const Text(
                            'Do you wont to delete GroupName',
                            style: TextStyle(fontSize: 16),
                          ),
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'No',

                              ),
                            ),
                            CupertinoActionSheetAction(
                                onPressed: () {
                                  //TODO Delete group
                                },
                                child: const Text('Yes',style: TextStyle(color: Colors.red),)),
                          ],
                        );
                      });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                   padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15))),
                child: const Text('Delete Group')),
          ],
        ),
      ),
    );
  }

  Widget buildGroupFiles() {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all()),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  padding: const EdgeInsets.only(right: 12.0),
                  decoration: const BoxDecoration(
                      border: Border(
                          right:
                              BorderSide(width: 1.0, color: Colors.black87))),
                  child: IconButton(
                    icon: const Icon(Icons.delete_outline_outlined,
                        color: Colors.red),
                    onPressed: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoActionSheet(
                              title: Text(
                                'Delete File',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.red[400]),
                              ),
                              message: Text(
                                'Do you wont to delete FileName',
                                style: TextStyle(fontSize: 16),
                              ),
                              actions: [
                                CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'No',

                                  ),
                                ),
                                CupertinoActionSheetAction(
                                    onPressed: () {
                                      //TODO Delete File
                                    },
                                    child: Text('Yes',style: TextStyle(color: Colors.red),)),
                              ],
                            );
                          });
                    },
                  ),
                ),
                title: const Text(
                  "Name Of File",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                subtitle: Row(
                  children: const [
                    Icon(Icons.linear_scale, color: Colors.yellowAccent),
                    Text(" Available", style: TextStyle(color: Colors.black))
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.keyboard_arrow_right,
                      color: Colors.blue, size: 30.0),
                  onPressed: () {
                    navigateTo(context, FileDetails());
                  },
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 20,
            );
          },
          itemCount: 12),
    );
  }
}
