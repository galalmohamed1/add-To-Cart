import 'package:add_to_cart/core/assets.dart';
import 'package:add_to_cart/features/category/data/addation_data_model.dart';
import 'package:add_to_cart/features/category/data/extras_data_model.dart';
import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/features/category/data/weight_data.dart';
import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/features/category/view/widget/addaition_data.dart';
import 'package:add_to_cart/features/category/view/widget/extras_screen.dart';
import 'package:flutter/material.dart';

class Bottomsheet extends StatefulWidget {
  final int index;
  final ProductDataModel product;
  const Bottomsheet({super.key, required this.product, required this.index});

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  
  int count =1;
  List<WeightData> weights = [
    WeightData(label: '1/4 Kilo', price: '131.20 EGP'),
    WeightData(label: '1/3 Kilo', price: '196.50 EGP'),
    WeightData(label: '1/2 Kilo', price: '262.50 EGP'),
    WeightData(label: '1 Kilo',   price: '525.50 EGP'),
  ];
  int isSelected = -1;
  List<AddationDataModel> additionData = [
    AddationDataModel(
      image: Assets.assetsImagesAdditionImage,
      name: 'Sesame Paste Salad - S',
      price: '23 EGP',
    ),
    AddationDataModel(
      image: Assets.assetsImagesAdditionImage,
      name: 'Sesame Paste Salad - M',
      price: '27 EGP',
    ),
    AddationDataModel(
      image: Assets.assetsImagesAdditionImage,
      name: 'Sesame Paste Salad - L',
      price: '30 EGP',
    ),
    
  ];
  List<ExtrasDataModel> extras= [
    ExtrasDataModel(
      check: false,
      name: 'Sesame Paste Salad',
      price: '10 EGP',
    ),
    ExtrasDataModel(
      check: false,
      name: 'Sesame Paste Salad',
      price: '15 EGP',
    ),
    ExtrasDataModel(
      check: false,
      name: 'Sesame Paste Salad',
      price: '15 EGP',
    ),
    ExtrasDataModel(
      check: false,
      name: 'Sesame Paste Salad',
      price: '15 EGP',
    ),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Column(  
      children: [
        Align(
          alignment:Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close, color: Colors.black),
          ),
        ),
        SizedBox(height: 21),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            width: 398,
            height: 141,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: 132,
                    height: 132,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.product.prodect[widget.index].image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 177,
                        height: 61,
                        child:  Text(
                          widget.product.prodect[widget.index].name,
                          // 'Grilled Steak, with Boiled\n Basmati Rice And Salad',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                               Text(
                                widget.product.prodect[widget.index].description,
                                // '178 EGP',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: ColorsApp.grey,
                                ),
                              ),
                              Text(
                                widget.product.prodect[widget.index].price,
                                // '125 EGP',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffFE962D),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 135,
                            height: 41,
                            child: Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFE962D),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                     setState(() {
                                       if (count > 0) {
                                      count--;
                                    }
                                     });
                                    },
                                    icon: const Icon(Icons.remove, color: Colors.white, size: 16),
                                  ),
                                ),
                                Spacer(),
                                Text(count.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),),
                                Spacer(),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFE962D),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                      count++;
                                      });
                                    },
                                    icon: const Icon(Icons.add, color: Colors.white, size: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 9.15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 17.61),
        Container(
          width: 389,
          height: 134,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorsApp.borderColor,
              width: 0.5,
            ),
          ),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Weights",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: ColorsApp.textColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  Expanded(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                     gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4,
                      // crossAxisSpacing: 12,
                      // mainAxisSpacing: 35,
                     ),
                      itemCount: weights.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => setState(() { isSelected = index; }),
                          child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 186,
                              height: 45,
                              decoration: BoxDecoration(
                                color: ColorsApp.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:  [
                                  BoxShadow(
                                    color: ColorsApp.borderColor,
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 1),
                                    ),],),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(weights[index].label,
                                        style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: ColorsApp.textColor,
                                        ),
                                        ),
                                        Text(weights[index].price,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: ColorsApp.textColor,
                                          ),
                                          ),
                                      GestureDetector(
                                        onTap: () => setState(() {isSelected = index;}),
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: ColorsApp.black,
                                              width: 2,
                                            ),
                                          ),
                                          child: isSelected==index
                                              ? Center(
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: ColorsApp.primaryColor,
                                                    ),
                                                    child: Icon(Icons.check,
                                                      color: Colors.white,
                                                      size: 16,
                                                    ),
                                                  ),
                                                )
                                              : null,
                                        ),
                                      ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          );
                      },
                    ),
                  ),
                ],
          ),
        ),
        SizedBox(height: 23),
        Container(
          width: 386,
          height: 330,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorsApp.borderColor,
              width: 0.5,
            ),
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
              Expanded(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: additionData.length,
                      // padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: AddaitionScreen(add: additionData[index],),
                      ) ,
                    ),
                  ),
            ],
          ),
        ),
        SizedBox(height: 33),
        Container(
          width: 386,
          height: 330,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorsApp.borderColor,
              width: 0.5,
            ),
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
              Expanded(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: extras.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: ExtrasScreen(dataModel: extras[index],),
                      ) ,
                    ),
                  ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsApp.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(
                      'Add To Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '1263 EGP',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                 ],
               ),
           ),
        ),
      ],
    );
  }
}
