import 'package:booksale/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import ' bloc/card_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/card_entity.dart';
import 'widgets/add_card_bottom_sheet.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  Future<void> _openAddCardSheet(BuildContext context) async {
    final newCard = await showModalBottomSheet<CardEntity>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const AddCardBottomSheet(),
    );

    if (newCard != null && context.mounted) {
      context.read<CardBloc>().add(AddCard(newCard));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ödəniş üsullari', style: AppTextstyle.appBarTitle),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.primaryBrown),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xffd6e0dc),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.verified_user, color: AppColors.badgeUsed),
                      const SizedBox(width: 20),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Təhlükəsiz Ödəniş',
                              style: TextStyle(
                                color: AppColors.badgeUsed,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Kart məlumatlarınız SSL protokolu ilə qorunur və heç vaxt üçüncü tərəfə ötürülmür.',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            BlocBuilder<CardBloc, CardState>(
              builder: (context, state) {
                if (state is CardLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                final cards = state is CardLoaded
                    ? state.cards
                    : <CardEntity>[];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Yadda saxlanılan kartlar',
                          style: AppTextstyle.sectionTitle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    ...cards.map(
                      (card) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _SavedCardItem(card: card),
                      ),
                    ),

                    InkWell(
                      onTap: () => _openAddCardSheet(context),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: const Color(0xffd6e0dc),
                              child: Icon(
                                Icons.add_card,
                                color: AppColors.badgeUsed,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Yeni kart əlavə et',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Debit və ya Kredit kartı',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 24),

            Text(
              'Digər üsullar',
              style: AppTextstyle.sectionTitle.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 12),
            _OtherMethodItem(
              icon: Icons.payments_outlined,
              title: 'Qapıda nağd ödəniş',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _SavedCardItem extends StatelessWidget {
  final CardEntity card;

  const _SavedCardItem({required this.card});

  @override
  Widget build(BuildContext context) {
    final lastFour = card.cardNumber.length >= 4
        ? card.cardNumber.substring(card.cardNumber.length - 4)
        : card.cardNumber;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                card.cardType,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<CardBloc>().add(DeletedCard(cardId: card.id));
                },
                icon: Icon(
                  Icons.delete_outlined,
                  size: 22,
                  color: AppColors.primaryBrown,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '**** $lastFour',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kartın Sahibi',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    card.cardHolder,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text(card.expiryDate),
            ],
          ),
        ],
      ),
    );
  }
}

class _OtherMethodItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _OtherMethodItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryBrown),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
