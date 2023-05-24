part of '../../qr.dart';

class ResultEntity extends Equatable {
  final DateTime createdAt;
  final String data;

  const ResultEntity({required this.data, required this.createdAt});

  @override
  List<Object> get props => [data, createdAt];
}
