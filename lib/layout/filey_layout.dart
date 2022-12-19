import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:filey/layout/cubit/filey_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/constants.dart';
import '../shared/components/size_config.dart';

class FileyLayout extends StatelessWidget {
  const FileyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var  items = <Widget>[
      Container(
        height: 56,
        child: Column(
          children: [
            Icon(
              Icons.home,
              size: 30.0,
              color: Colors.blue,
            ),
            Text(
              'Home',
              style: TextStyle(
                  color: Colors.blue
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 56,
        child: Column(
          children: [
            Icon(
              Icons.groups_outlined,
              size: 30.0,
              color: Colors.blue,
            ),
            Text(
              'Groups',
              style: TextStyle(
                  color: Colors.blue
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 56,
        child: Column(
          children: [

            Icon(
              Icons.file_download_rounded,
              size: 30.0,
              color: Colors.blue,
            ),
            Text(
              'cart',
              style: TextStyle(
                  color: Colors.blue
              ),
            ),

          ],
        ),
      ),
      Container(
        height: 56,
        child: Column(
          children: [
            Icon(
              Icons.upload,
              size: 25.0,
              color: Colors.blue,
            ),

            Text(
              'Uploaded',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),


    ];
    var cubit = FileyCubit.get(context);

    return BlocConsumer<FileyCubit, FileyState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () => showExitPopup(context),
          child: SafeArea(
            top: false,
            child: Scaffold(
              extendBody: true,
              backgroundColor: Colors.white,
              body:IndexedStack(
                index: cubit.currentIndex,
                children: cubit.bottomScreen,
              ) ,
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(
                      color: kPrimaryColor),
                ),
                child: CurvedNavigationBar(
                  backgroundColor: Colors.transparent,
                  height: 60.0,

                  color: Colors.grey[100]!,
                  buttonBackgroundColor: Colors.white,
                  animationCurve: Curves.easeInOut,
                  animationDuration: Duration(milliseconds: 300),
                  items: items,
                  index: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottom(index);
                  },
                ),
              ),
            ),
          ),
        );
      },

    );
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

              ),
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Exit From Filey", textAlign: TextAlign
                      .center, style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            exit(0);
                          },
                          child: Text("Yes"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red.shade800),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("No", style: TextStyle(color: Colors
                                .black)),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
