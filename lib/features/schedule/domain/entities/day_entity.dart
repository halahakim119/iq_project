import 'package:equatable/equatable.dart';

import 'branch_entity.dart';

class DayEntity extends Equatable {
  final BranchEntity? ksc;
  final BranchEntity? awbara;
  const DayEntity({this.ksc, this.awbara});

  @override
  List<Object?> get props => [ksc, awbara];
}
