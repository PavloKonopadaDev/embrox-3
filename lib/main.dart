import 'package:ebmrox_3version/tv_show/bloc/tv_show_bloc.dart';
import 'package:ebmrox_3version/tv_show/repository/tv_show_repository.dart';
import 'package:ebmrox_3version/tv_show/view/tv_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ShowRepository showRepository = ShowRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TV Shows',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TVShowBloc(showRepository),
        child: const ListPage(),
      ),
    );
  }
}
