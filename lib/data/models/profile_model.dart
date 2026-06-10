class ProfileModel {
  final String name;
  final String email;
  final int booksBought;
  final int wishlistCount;
  final String? avatarUrl;

  const ProfileModel({
    required this.name,
    required this.email,
    required this.booksBought,
    required this.wishlistCount,
    this.avatarUrl,
  });
}