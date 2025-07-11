class WeightData {
  final String label;
  final String price;

  WeightData({required this.label, required this.price});
  
  factory WeightData.fromMap(Map<String, dynamic> json) {
    return WeightData(
      label: json['label'],
      price: json['price'],
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'price': price,
    };
  }
}