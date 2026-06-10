class ApiEndpoints {
  static const String baseUrl = 'https://kitab-bazari-api.onrender.com';
  static const String apiPrefix = '/api';

  static const String register = '$apiPrefix/auth/register';
  static const String login = '$apiPrefix/auth/login';
  static const String refresh = '$apiPrefix/auth/refresh';
  static const String logout = '$apiPrefix/auth/logout';
  static const String forgotPassword = '$apiPrefix/auth/forgot-password';
  static const String verifyOtp = '$apiPrefix/auth/verify-otp';
  static const String resendOtp = '$apiPrefix/auth/resend-otp';
  static const String resetPassword = '$apiPrefix/auth/reset-password';

  static const String books = '$apiPrefix/books';
  static const String featuredBooks = '$apiPrefix/books/featured';
  static const String searchBooks = '$apiPrefix/books/search';

  static String booksByCategory(String id) =>
      '$apiPrefix/books/by-category/$id';

  static String book(String id) => '$apiPrefix/books/$id';

  static const String categories = '$apiPrefix/categories';

  static const String favorites = '$apiPrefix/favorites';

  static String favorite(String bookId) => '$apiPrefix/favorites/$bookId';

  static const String cart = '$apiPrefix/cart';
  static const String cartItems = '$apiPrefix/cart/items';

  static String cartItem(String bookId) => '$apiPrefix/cart/items/$bookId';
  static const String applyPromo = '$apiPrefix/cart/apply-promo';
  static const String cartPromo = '$apiPrefix/cart/promo';

  static const String orders = '$apiPrefix/orders';

  static String order(String id) => '$apiPrefix/orders/$id';

  static String cancelOrder(String id) => '$apiPrefix/orders/$id/cancel';

  static String repeatOrder(String id) => '$apiPrefix/orders/$id/repeat';

  static String trackOrder(String id) => '$apiPrefix/orders/$id/track';

  static const String addresses = '$apiPrefix/addresses';

  static String address(String id) => '$apiPrefix/addresses/$id';

  static String setDefaultAddress(String id) =>
      '$apiPrefix/addresses/$id/set-default';

  static const String paymentCards = '$apiPrefix/payment-cards';

  static String paymentCard(String id) => '$apiPrefix/payment-cards/$id';

  static String setDefaultCard(String id) =>
      '$apiPrefix/payment-cards/$id/set-default';

  static const String profile = '$apiPrefix/profile';
  static const String profileAvatar = '$apiPrefix/profile/avatar';
  static const String changePassword = '$apiPrefix/profile/change-password';
  static const String profileStats = '$apiPrefix/profile/stats';

  static const String notifications = '$apiPrefix/notifications';
  static const String unreadCount = '$apiPrefix/notifications/unread-count';

  static String markRead(String id) => '$apiPrefix/notifications/$id/read';
  static const String markAllRead = '$apiPrefix/notifications/mark-all-read';

  static const String reviews = '$apiPrefix/reviews';

  static String reviewsByBook(String bookId) =>
      '$apiPrefix/reviews/book/$bookId';

  static const String settings = '$apiPrefix/settings';

  static String validatePromo(String code) => '$apiPrefix/promo/validate/$code';
}
