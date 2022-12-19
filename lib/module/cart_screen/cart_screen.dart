import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/components/components.dart';
import '../file_details/file_details.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all()),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      leading: Container(
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
                                    message: const Text(
                                      'Do you wont to delete FileName From Cart',
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
                                            //TODO Delete File
                                          },
                                          child: Text(
                                            'Yes',
                                            style: const TextStyle(
                                                color: Colors.red),
                                          )),
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

                      trailing: Wrap(
                        spacing: 0, // space between two icons
                        children: <Widget>[
                          TextButton(
                              onPressed: () {},
                              child: Text('Check In')), // icon-1
                          TextButton(
                              onPressed: () {},
                              child: Text('Check Out')), // icon-1
                          TextButton(
                              onPressed: () async {
                                FilePickerResult? result =
                                await FilePicker.platform.pickFiles();

                                if (result != null) {
                                  File file = File(result.files.single.path!);
                                } else {
                                  // User canceled the picker
                                }
                              },
                              child: Text('Upload')), // icon-1
                          // icon-2
                        ],
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
          ),
        ),
        bottomNavigationBar: Container(
          height: 180,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, -15),
                    blurRadius: 20,
                    color: Color(0xFFDADADA).withOpacity(0.15)),
              ]),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: 190,
                    child: buildDefaultButton(
                        register: true,
                        text: 'Bulk Check In',
                        function: () {},
                        height: 56),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
