import 'package:booksale/domain/entities/cart.dart';

class Order {
  final String id;
  final String orderNumber;
  final String deliveryAddress;
  final String deliveryMethod;
  final String paymentMethod;
  final String status;
  final List<OrderItem> items;
  final double total;
  final DateTime createdAt;
  final int itemCount;

  Order({
    required this.id,
    required this.items,
    required this.orderNumber,
    required this.deliveryAddress,
    required this.deliveryMethod,
    required this.paymentMethod,
    required this.status,
    required this.total,
    required this.createdAt,
    required this.itemCount,
  });
}

class OrderItem {
  final String bookId;
  final String title;
  final String author;
  final String coverImageUrl;
  final double price;
  final int quantity;

  OrderItem({
    required this.bookId,
    required this.title,
    required this.author,
    required this.coverImageUrl,
    required this.price,
    required this.quantity,
  });
}
