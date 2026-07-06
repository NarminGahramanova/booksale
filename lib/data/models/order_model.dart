import '../../domain/entities/order.dart';

class OrderItemModel extends OrderItem {
  const OrderItemModel({
    required super.bookId,
    required super.title,
    required super.author,
    required super.coverImageUrl,
    required super.price,
    required super.quantity,
  });

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

class OrderModel extends Order {
  const OrderModel({
    required super.id,
    required super.orderNumber,
    required super.deliveryAddress,
    required super.deliveryMethod,
    required super.total,
    required super.paymentMethod,
    required super.status,
    required super.items,
    required super.createdAt,
    required super.itemCount,
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