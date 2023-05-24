part of '../../qr.dart';

abstract class QRRemoteSource {
  Future<ResultEntity> scanQR();
}

class QRRemoteSourceImpl implements QRRemoteSource {
  QRRemoteSourceImpl();

  @override
  Future<ResultEntity> scanQR() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) throw ServerException();
      final imageFile = File(pickedImage.path);
      final qrCode = await Scan.parse(imageFile.path);
      if (qrCode == null) throw throw ServerException();
      return ResultEntity(data: qrCode, createdAt: DateTime.now());
    } catch (error) {
      debugPrint('UserRemoteDataSourceImplError: $error');
      rethrow;
    }
  }
}
