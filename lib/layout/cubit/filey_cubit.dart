 import 'package:bloc/bloc.dart';
import 'package:filey/module/cart_screen/cart_screen.dart';
import 'package:filey/module/groups_screen/groups_screen.dart';
import 'package:filey/module/reports_screen/reports_screen.dart';
import 'package:filey/module/uploaded_files_screen/uploaded_files.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../module/home_screen/home_screen.dart';

part 'filey_state.dart';

class FileyCubit extends Cubit<FileyState> {
  FileyCubit() : super(FileyInitial());
  static FileyCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreen = [
    HomeScreen(),
    GroupsScreen(),
    CartScreen(),
    UploadedFiles(),
    ReportsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(FileyChangeBottomState());
  }
}
