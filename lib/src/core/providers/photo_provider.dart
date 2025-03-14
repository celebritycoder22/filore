import 'package:filore/src/core/models/photo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final photoProvider = StateProvider<Photo?>((ref) => null);
StateProvider<Photo?> selectedPhotoProvider =
    StateProvider<Photo?>((ref) => null);
