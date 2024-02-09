import 'package:block_test/screen/bloc/counter/counter_block.dart';

import 'package:block_test/screen/bloc/image_picker/bloc/image_picker_bloc.dart';
import 'package:block_test/screen/bloc/switch/switch_block.dart';
import 'package:block_test/screen/bloc/todo/todo_bloc.dart';

import 'package:block_test/screen/ui/switch_ui/switch_view.dart';
import 'package:block_test/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBlock()),
        BlocProvider(create: (context) => ImagePickerBloc(imagePickerUtils: ImagePickerUtils())),
        BlocProvider(create: (context) => TodoBloc()),
        // BlocProvider(create: (context) => FavouriteBloc(FavouriteRepository())),

        
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SwitchView(),
      ),
    );
  }
}
