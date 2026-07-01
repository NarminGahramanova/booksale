import 'package:booksale/core/theme/app_colors.dart';
import 'package:booksale/core/theme/app_textstyle.dart';
import 'package:booksale/data/services/address_service.dart';
import 'package:booksale/presentation/page/profil_page/widgets/add_address_button.dart';
import 'package:booksale/presentation/page/profil_page/widgets/address_card.dart';
import 'package:booksale/presentation/page/profil_page/widgets/address_map_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/adress_model.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  List<AddressModel> addresses = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadAddresses();
  }

  Future<void> _loadAddresses() async {
    setState(() => isLoading = true);
    try {
      final result = await AddressService.getAllAddresses();
      if (result is List) {
        final list = result
            .map((addr) => AddressModel.fromJson(addr as Map<String, dynamic>))
            .toList();
        setState(() => addresses = list);
      }
    } catch (e) {}
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.backgroundColor,
        title: Text('Ünvanlarım', style: AppTextstyle.appBarTitle),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.primaryBrown),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              color: AppColors.backgroundColor,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Çatdırılma üçün qeyd edilmiş ünvanlarınızı\nburadan idarə edə bilərsiniz.',
                            style: AppTextstyle.bodyText,
                          ),
                          const SizedBox(height: 16),
                          if (addresses.isEmpty)
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 40,
                                ),
                                child: Text(
                                  'Ünvan yoxdur',
                                  style: AppTextstyle.bestseller,
                                ),
                              ),
                            )
                          else
                            ...addresses.map((address) {
                              return AddressCard(
                                title: address.title,
                                street: address.street,
                                city: address.city,
                                phone: address.phone,
                                icon: Icons.location_on_outlined,
                                iconBgColor: const Color(0xFFF5F5F5),
                                isMain: address.isDefault,
                                onEdit: () {
                                   },
                                onDelete: () {
                                 },
                              );
                            }).toList(),
                          const SizedBox(height: 4),
                          AddressMapSection(
                            onTap: () {
                            },
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  AddAddressButton(
                    onTap: () {

                    },
                  ),
                ],
              ),
            ),
    );
  }
}
