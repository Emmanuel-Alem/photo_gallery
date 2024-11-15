// lib/bloc/photo_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/photo_repository.dart';
import 'photo_event.dart';
import 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository repository;

  PhotoBloc({required this.repository}) : super(PhotoInitial()) {
    on<FetchPhotos>((event, emit) async {
      emit(PhotoLoading());
      try {
        final photos = await repository.fetchPhotos();
        emit(PhotoLoaded(photos));
      } catch (e) {
        emit(PhotoError("Failed to load photos"));
      }
    });
  }
}
