import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  final ImagePicker _picker = ImagePicker();
  final List<String> _images = [];

  AddBloc() : super(AddInitial()) {
    on<PickFromCamera>(_onPickFromCamera);
    on<PickFromGallery>(_onPickFromGallery);
  }

  Future<void> _onPickFromCamera(
      PickFromCamera event,
      Emitter<AddState> emit,
      ) async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.camera);
      if (file != null) {
        _images.add(file.path);
        emit(ImageLoaded(images: List.from(_images)));
      }
    } catch (e) {
      emit(ImageError(message: e.toString()));
    }
  }

  Future<void> _onPickFromGallery(
      PickFromGallery event,
      Emitter<AddState> emit,
      ) async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        _images.add(file.path);
        emit(ImageLoaded(images: List.from(_images)));
      }
    } catch (e) {
      emit(ImageError(message: e.toString()));
    }
  }
}