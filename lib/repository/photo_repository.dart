import '../api/photo_api_provider.dart';
import '../models/photo.dart';

class PhotoRepository {
  final PhotoApiProvider apiProvider;

  PhotoRepository({required this.apiProvider});

  Future<List<Photo>> fetchPhotos() {
    return apiProvider.fetchPhotos();
  }
}
