import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/features/category/data/extras_data_model.dart';
import 'package:add_to_cart/features/category/logic/home_cubit.dart';
import 'package:add_to_cart/features/category/logic/home_state.dart';
import 'package:add_to_cart/features/category/view/widget/extras_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExtrasWidget extends StatelessWidget {
  const ExtrasWidget({super.key, required this.extras});
final List<ExtrasDataModel> extras;
  @override
  Widget build(BuildContext context) {
    return 
        Container(
          width: 386,
          // height: 330,
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
                  "Extras:",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: ColorsApp.textColor,
                  ),
                ),
              ),
               ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: extras.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: ExtrasScreen(extras: extras[index]),
                      ),
                    
                
              ),
            ],
          ),
        );
        
  }
}