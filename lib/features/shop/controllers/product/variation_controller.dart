import 'package:e_comm/features/shop/controllers/product/cart_controller.dart';
import 'package:e_comm/features/shop/controllers/product/images_controller.dart';
import 'package:e_comm/features/shop/models/product_model.dart';
import 'package:e_comm/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  /// select Attribute
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    /// attribute selected
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;


    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValue(
            variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    /// show selected variation image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }
    if(selectedVariation.id.isNotEmpty){
      final cartController = CartController.instance ;
      cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id) ;
    }

    this.selectedVariation.value = selectedVariation;

    getProductVariationStockStatus();
  }

  /// check if selected matches any variation
  bool _isSameAttributeValue(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  /// attribute available
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variation, String attributesName) {
    final availableVariationAttributes = variation
        .where((variation) =>
            variation.attributeValues[attributesName] != null &&
            variation.attributeValues[attributesName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributeValues[attributesName])
        .toSet();
    return availableVariationAttributes ;
  }

  String getVariationPrice(){
    return selectedVariation.value.salePrice > 0 ?  selectedVariation.value.salePrice.toString() : selectedVariation.value.price.toString() ;
  }

  /// check if product in stock
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// reset Selected Attributes
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
