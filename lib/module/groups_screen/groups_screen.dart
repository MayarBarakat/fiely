import 'package:filey/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../models/group_model/group_model.dart';
import '../group_details/group_details.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  var pageController = PageController();
  List<String> titles = [
    'Created Groups',
    'Invited Groups',
    'All Groups',
  ];
  List<GroupModel> group = [
    GroupModel('Group Name', '2022', 'Mayar'),
    GroupModel('Group Name', '2021', 'Said'),
    GroupModel('Group Name', '2020', 'Public'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.bounceInOut);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.blue,
                )),
          ],
          leading: IconButton(
              onPressed: () {
                pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.bounceInOut);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.blue,
              ))

          // IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.blue,)),

          ),
      body: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) {
          return buildGroupScreen(group[index],index);
        },
        itemCount: 3,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
  Widget buildGroupScreen(GroupModel model,index){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(child: Text(titles[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
          ),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
                itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue[100]!,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: ListTile(
                      onTap: () {
                        navigateTo(context, GroupDetails());
                      },
                      title: Text(model.name),
                      subtitle: Text(
                        'Created At ${model.date}',
                        overflow: TextOverflow.ellipsis,
                      ),
                      isThreeLine: true,
                      leading: CircleAvatar(
                        radius: 22,
                        child: FlutterLogo(),
                      ),
                      trailing: Text('${model.owner}'),
                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return SizedBox(height: 25,);
                },
                itemCount: 10
            ),
          )
        ],
      ),
    );
  }
}
