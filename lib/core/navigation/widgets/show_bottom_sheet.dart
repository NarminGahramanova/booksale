import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/page/add/bloc/add_bloc.dart';

void showImagePickerSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Kameradan çək'),
                onTap: () {
                  Navigator.pop(context);
                  context.read<AddBloc>().add(PickFromCamera());
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Qalereyadan seç'),
                onTap: () {
                  Navigator.pop(context);
                  context.read<AddBloc>().add(PickFromGallery());
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}