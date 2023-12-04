import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellers/constants/routes.dart';
import 'package:sellers/models/seller_model.dart';
import 'package:sellers/provider/app_provider.dart';
import 'package:sellers/widgets/edit_user.dart';

class SingleUserCard extends StatefulWidget {
  final SellerModel sellerModel;
  final int index;
  const SingleUserCard(
      {super.key, required this.sellerModel, required this.index});

  @override
  State<SingleUserCard> createState() => _SingleUserCardState();
}

class _SingleUserCardState extends State<SingleUserCard> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              child:
                  // //widget.sellerModel.profilePhoto != null?
                  //     CircleAvatar(
                  //         radius: 30,
                  //         backgroundImage:
                  //             NetworkImage("widget.sellerModel.profilePhoto!"),
                  //       )
                  //     :
                  const CircleAvatar(
                radius: 30,
                child: Icon(Icons.person),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.sellerModel.firstName),
                Text(widget.sellerModel.email),
              ],
            ),
            const Spacer(),
            isloading
                ? const CircularProgressIndicator()
                : GestureDetector(
                    onLongPress: () async {
                      setState(() {
                        isloading = true;
                      });
                      await appProvider
                          .deleteUserFromFirebase(widget.sellerModel);
                      setState(() {
                        isloading = false;
                      });
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
            const SizedBox(width: 10),
            GestureDetector(
                onTap: () {
                  Routes.instance.push(
                      widget: EditSeller(
                        sellerModel: widget.sellerModel,
                        index: widget.index,
                      ),
                      context: context);
                },
                child: const Icon(Icons.edit))
          ],
        ),
      ),
    );
  }
}
