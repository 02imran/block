import 'dart:io';

import 'package:block_test/screen/bloc/image_picker/bloc/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
        if (state.file == null) {
          return InkWell(
            onTap: () {
              context.read<ImagePickerBloc>().add(CameraCapture());
            },
            child: CircleAvatar(
              child: Icon(Icons.camera),
            ),
          );
        } else {
          return Image.file(File(state.file!.path.toString()));
        }
      }),
    );
  }
}
