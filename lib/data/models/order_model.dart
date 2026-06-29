import '../../domain/entities/order.dart';

class OrderItemModel {
  final String bookId;
  final String title;
  final String author;
  final String coverImageUrl;
  final double price;
  final int quantity;

  OrderItemModel({
    required this.bookId,
    required this.title,
    required this.author,
    required this.coverImageUrl,
    required this.price,
    required this.quantity,
  });

  OrderItem toEntity() {
    return OrderItem(
      bookId: bookId,
      title: title,
      author: author,
      coverImageUrl: coverImageUrl,
      price: price,
      quantity: quantity,
    );
  }

  factory OrderItemModel.fromEntity(OrderItem item) {
    return OrderItemModel(
      bookId: item.bookId,
      title: item.title,
      author: item.author,
      coverImageUrl: item.coverImageUrl,
      price: item.price,
      quantity: item.quantity,
    );
  }

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      bookId: json['bookId'] ?? '',
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      coverImageUrl: json['coverImageUrl'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 0,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'bookId': bookId,
      'title': title,
      'author': author,
      'coverImageUrl': coverImageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}

class OrderModel {
  final String id;
  final String orderNumber;
  final String deliveryAddress;
  final String deliveryMethod;
  final double total;
  final String paymentMethod;
  final String status;
  final List<OrderItemModel> items;
  final DateTime createdAt;
  final int itemCount;

  OrderModel({
    required this.id,
    required this.orderNumber,
    required this.deliveryAddress,
    required this.deliveryMethod,
    required this.total,
    required this.paymentMethod,
    required this.status,
    required this.items,
    required this.createdAt,
    required this.itemCount,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? '',
      orderNumber: json['orderNumber'] ?? '',
      deliveryAddress: json['deliveryAddress'] ?? '',
      deliveryMethod: json['deliveryMethod'] ?? '',
      paymentMethod: json['paymentMethod'] ?? '',
      status: json['status'] ?? '',
      items: (json['items'] as List<dynamic>? ?? [])
          .map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] ?? 0).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      itemCount: json['itemCount'] ?? 0,
    );
  }
}
