import 'package:equatable/equatable.dart';

class DayEntity extends Equatable {
  final List<String>? ksc;
  final List<String>? awbara;
  const DayEntity({this.ksc, this.awbara});

  @override
  List<Object?> get props => [ksc, awbara];
}
