// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/pages/photoGallery.dart';
import 'bloc/photo_bloc.dart';
import 'bloc/photo_event.dart';
import 'repository/photo_repository.dart';
import 'api/photo_api_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PhotoRepository repository =
      PhotoRepository(apiProvider: PhotoApiProvider());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) =>
            PhotoBloc(repository: repository)..add(FetchPhotos()),
        child: const PhotoGalleryScreen(),
      ),
    );
  }
}
