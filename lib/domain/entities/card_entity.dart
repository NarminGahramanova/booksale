import 'package:equatable/equatable.dart';

class CardEntity extends Equatable{
  final String id;
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;
  final String cardType;
  final bool isDefault;

  const CardEntity({
    required this.id,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    required this.cardType,
    required this.isDefault,
  });

  @override
  List<Object?> get props => [
    id,
    cardNumber,
    cardHolder,
    expiryDate,
    cardType,
    isDefault,

  ];
}
