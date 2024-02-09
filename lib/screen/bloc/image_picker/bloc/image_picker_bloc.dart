import 'package:bloc/bloc.dart';
import 'package:block_test/utils/image_picker_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc({required this.imagePickerUtils}) : super(const ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_gallaryCapture);
  }

  void _cameraCapture(CameraCapture event, Emitter<ImagePickerState> emit) async{
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }


  void _gallaryCapture(GalleryImagePicker event, Emitter<ImagePickerState> emit) async{
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }
}
