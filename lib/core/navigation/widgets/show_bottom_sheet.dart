import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksale/presentation/page/add/bloc/add_bloc.dart';

void showImagePickerSheet(BuildContext context) {
  final addBloc = context.read<AddBloc>();

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Kameradan çək'),
            onTap: () {
              Navigator.pop(context);
              addBloc.add(PickFromCamera());
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Qalereyadan seç'),
            onTap: () {
              Navigator.pop(context);
              addBloc.add(PickFromGallery());
            },
          ),
        ],
      ),
    ),
  );
}