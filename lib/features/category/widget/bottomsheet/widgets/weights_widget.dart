import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/features/category/data/weight_data.dart';
import 'package:add_to_cart/features/category/logic/home_cubit.dart';
import 'package:add_to_cart/features/category/logic/home_state.dart';
import 'package:add_to_cart/features/category/widget/weights_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightsWidget extends StatelessWidget {
  final List<WeightData> weights;
  const WeightsWidget({super.key, required this.weights});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      // height: 165,
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
              "Weights",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: ColorsApp.textColor,
              ),
            ),
          ),
          SizedBox(height: 10),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4,
            ),
            itemCount: weights.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: WeightsScreen(index: index, weight: weights[index]),
            ),
          ),
        ],
      ),
    );
  }
}
