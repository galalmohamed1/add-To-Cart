import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/features/category/data/addation_data_model.dart';
import 'package:add_to_cart/features/category/logic/home_cubit.dart';
import 'package:add_to_cart/features/category/logic/home_state.dart';
import 'package:add_to_cart/features/category/view/widget/addaition_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdditionWidget extends StatelessWidget {
  final List<AddationDataModel>salads;
  const AdditionWidget({super.key, required this.salads});
  
  @override
  Widget build(BuildContext context) {
    return 
        Container(
          width: 386,
          // height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorsApp.borderColor, width: 0.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Addition ( select 8):",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: ColorsApp.textColor,
                  ),
                ),
              ),
               ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: salads.length,
                      // padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: AddaitionScreen(add: salads[index]),
                      ),
              ),
            ],
          ),
        );
  }
}