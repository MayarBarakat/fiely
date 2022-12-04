import 'package:bloc/bloc.dart';
import 'package:filey/layout/cubit/filey_cubit.dart';
import 'package:filey/layout/filey_layout.dart';
import 'package:filey/module/auth_screens/login_screen/login_screen.dart';
import 'package:filey/module/on_boarding/on_boarding_screen.dart';
import 'package:filey/shared/network/local/cache_helper.dart';
import 'package:filey/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await DioHelper.init();
  bool? onBoarding = await CacheHelper.getData(key: 'onBoarding');
  Widget widget;
  if(onBoarding != null){
    widget = LoginScreen();
  }else{
    widget = OnBoardingScreen();
  }

  runApp( MyApp(widget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget? widget;
  const MyApp({Key? key,this.widget}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FileyCubit(),
        ),
      ],
      child: BlocConsumer<FileyCubit, FileyState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            title: 'Filey',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(

              primarySwatch: Colors.blue,
            ),
            home:  widget,
          );
        },
      ),
    );
  }
}

