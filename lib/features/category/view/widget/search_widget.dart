
import 'package:add_to_cart/features/category/widget/main_button.dart';
import 'package:add_to_cart/features/category/widget/main_text_field.dart';
import 'package:add_to_cart/core/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Expanded(
                  flex: 5,
                  child: Form(
                    key: _formKey,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2), 
                              spreadRadius: 2, 
                              blurRadius: 5, 
                              offset: Offset(0, 3),
                          ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: MainTextField(
                        controller: searchController,
                        label: "Search here",
                        prefix: const Icon(Icons.search),
                        suffix: Container(
                          width: 28,
                          decoration: BoxDecoration(
                            image:DecorationImage(
                              image: AssetImage("assets/images/a611fac2d8e2fc4f90c6091e9414715e4b1fda8a.png"),) ,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MainButton(
                    width: 40,
                    height: 40,
                    borderRadius: 8,                    
                    child: SvgPicture.asset(
                      Assets.assetsSvgFilterEditSvgrepoCom1,
                      width: 28,
                      height: 28,
                    ),
                    bgColor: Color(0xffFE962D),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    ontap: () => {
                      searchController.clear()
                    },
                  ),
                ),
              ],
            );
  }
}