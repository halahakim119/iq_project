import 'package:equatable/equatable.dart';

class DayEntity extends Equatable {
  final List<dynamic>? ksc;
  final List<dynamic>? awbara;
  const DayEntity({this.ksc, this.awbara});

  @override
  List<Object?> get props => [ksc, awbara];
}
