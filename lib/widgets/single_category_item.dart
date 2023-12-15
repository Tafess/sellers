// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellers/constants/theme.dart';
import 'package:sellers/controllers/firebase_firestore_helper.dart';
import 'package:sellers/models/catagory_model.dart';
import 'package:sellers/providers/app_provider.dart';

class SingleCategoryItem extends StatefulWidget {
  final CategoryModel singleCategory;
  final int index;
  const SingleCategoryItem(
      {super.key, required this.singleCategory, required this.index});

  @override
  State<SingleCategoryItem> createState() => _SingleCategoryItemState();
}

class _SingleCategoryItemState extends State<SingleCategoryItem> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: Image.network(
                      widget.singleCategory.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  widget.singleCategory.name,
                  style: themeData.textTheme.displayMedium,
                ),
              ],
            ),
          ),
          // Positioned(
          //   right: 0.2,
          //   child: Row(
          //     children: [
          //       IgnorePointer(
          //         ignoring: isLoading,
          //         child: GestureDetector(
          //           onTap: () async {
          //             setState(() {
          //               isLoading = true;
          //             });
          //             // await appProvider
          //             //     .deleteCategoryFromFirebase(widget.singleCategory);
          //             // setState(() {
          //             //   isLoading = false;
          //             // });
          //           },
          //           child: isLoading
          //               ? Center(
          //                   child: CircularProgressIndicator(),
          //                 )
          //               : const Icon(
          //                   Icons.delete,
          //                   color: Colors.red,
          //                 ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           // Routes.instance.push(
          //           //     widget: EditCategory(
          //           //         categoryModel: widget.singleCategory,
          //           //         index: widget.index),
          //           //     context: context);
          //         },
          //         child: const Icon(
          //           Icons.edit,
          //           color: Colors.green,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
