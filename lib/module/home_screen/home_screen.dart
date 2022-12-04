import 'package:filey/module/create_group_screen/create_group_screen.dart';
import 'package:filey/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../models/home_header_group/home_header_group_model.dart';

class HomeScreen extends StatelessWidget {

  List<HomeHeaderGroupModel> homeHeaderGroupsModel = [
    HomeHeaderGroupModel('Public', Icons.group),
    HomeHeaderGroupModel('Sports', Icons.group),
    HomeHeaderGroupModel('Create Group', Icons.add),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGroupList(homeHeaderGroupsModel),
            const Divider(
              thickness: 6,
              color: Colors.grey,
            ),
            Container(
              height: 500,
              decoration: BoxDecoration(
              color: Colors.blue[100]
              ),
              child: GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  crossAxisCount: 2,
                ),
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_present_outlined,
                          size: 100,
                          color: Colors.blue[200],
                          
                        ),
                        Text('File Name: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('From: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Created At: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_present_outlined,
                          size: 100,
                          color: Colors.blue[200],

                        ),
                        Text('File Name: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('From: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Created At: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_present_outlined,
                          size: 100,
                          color: Colors.blue[200],

                        ),
                        Text('File Name: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('From: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Created At: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_present_outlined,
                          size: 100,
                          color: Colors.blue[200],

                        ),
                        Text('File Name: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('From: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Created At: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_present_outlined,
                          size: 100,
                          color: Colors.blue[200],

                        ),
                        Text('File Name: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('From: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Created At: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_present_outlined,
                          size: 100,
                          color: Colors.blue[200],

                        ),
                        Text('File Name: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('From: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Created At: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_present_outlined,
                          size: 100,
                          color: Colors.blue[200],

                        ),
                        Text('File Name: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('From: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Created At: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildGroupList(List<HomeHeaderGroupModel> homeHeaderGroupsModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(60),
                        border: const Border.fromBorderSide(BorderSide.none),
                      ),
                      child: IconButton(
                        icon: Icon(homeHeaderGroupsModel[index].icon),
                        onPressed: () {
                          if(index == homeHeaderGroupsModel.length -1) {
                           navigateTo(context, CreateGroupScreen());
                          }
                        },
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${homeHeaderGroupsModel[index].name}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 20,
              );
            },
            itemCount: 3),
      ),
    );
  }
}
