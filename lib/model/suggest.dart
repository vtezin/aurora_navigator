import 'package:equatable/equatable.dart';

class Suggest extends Equatable {
  final String name;
  final String address;

  const Suggest(this.name, this.address);

  @override
  List<Object> get props => [name, address];
}
