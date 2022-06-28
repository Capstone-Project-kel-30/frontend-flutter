String tambahTitik(String price) {
  int sliceLength = 3;
  List<String> priceSlice = [];
  for (var i = price.length; i > 0; i -= sliceLength) {
    if (i < sliceLength) {
      priceSlice.insert(0, price.substring(0, i));
    } else {
      priceSlice.insert(0, price.substring(i - sliceLength, i));
    }
  }
  return priceSlice.join('.');
}

String capitalize(String string) {
  final String newString = string.toLowerCase();
  final String result =
      "${newString[0].toUpperCase()}${newString.substring(1, newString.length)}";
  return result;
}
