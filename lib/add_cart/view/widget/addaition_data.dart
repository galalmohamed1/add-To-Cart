import 'package:add_to_cart/add_cart/data/addation_data_model.dart';
import 'package:flutter/material.dart';

class AddaitionData extends StatefulWidget {
  const AddaitionData({super.key});

  @override
  State<AddaitionData> createState() => _AddaitionDataState();
}

class _AddaitionDataState extends State<AddaitionData> {
  List<AddationDataModel> additionData = [
    AddationDataModel(
      image: 'assets/images/addition1.png',
      name: 'Sesame Paste Salad - S',
      price: '23 EGP',
    ),
    AddationDataModel(
      image: 'assets/images/addition2.png',
      name: 'Sesame Paste Salad - M',
      price: '27 EGP',
    ),
    AddationDataModel(
      image: 'assets/images/addition2.png',
      name: 'Sesame Paste Salad - L',
      price: '30 EGP',
    ),
    
  ];
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}