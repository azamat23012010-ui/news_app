import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareService {
  final Dio _dio = Dio();

  Future<void> shareImage({
    required String imageUrl,
    String? text,
  }) async {
    try {
      // 1. Temp papka
      final tempDir = await getTemporaryDirectory();

      // 2. Unique file nomi
      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final filePath = '${tempDir.path}/$fileName';

      // 3. Download
      await _dio.download(imageUrl, filePath);

      // 4. Share
      await Share.shareXFiles(
        [XFile(filePath)],
        text: text ?? '',
      );
    } catch (e) {
      throw Exception('Rasmni ulashishda xatolik: $e');
    }
  }
}