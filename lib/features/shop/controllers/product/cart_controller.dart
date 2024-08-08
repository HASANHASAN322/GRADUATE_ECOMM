import 'package:e_comm/common/widgets/loader/loaders.dart';
import 'package:e_comm/features/shop/controllers/product/variation_controller.dart';
import 'package:e_comm/features/shop/models/cart_item_model.dart';
import 'package:e_comm/features/shop/models/product_model.dart';
import 'package:e_comm/utils/constants/enums.dart';
import 'package:e_comm/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  /// variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController(){
    loadCartItems() ;
  }

  void addToCart(ProductModel product) {
    /// quantity Check
    if (productQuantityInCart.value < 1) {
      TLoaders.customToast(message: 'Select Quantity');
      return;
    }
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      TLoaders.customToast(message: 'Select Variation');
      return;
    }
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        TLoaders.warningSnackBar(
            message: 'Selected Variation is out of stock.',
            title: 'Something Wrong');
        return;
      }
    } else {
      if (product.stock < 1) {
        TLoaders.warningSnackBar(
            message: 'Selected Variation is out of stock.',
            title: 'Something Wrong');
        return;
      }
    }

    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    /// check if already added
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);
    if (index > 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }
    updateCart();
    TLoaders.customToast(message: 'Your Product has been added to the card');
  }

  void addOneToCart(CartItemModel item) {

    /// check if already added
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);
    if (index > 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();

  }

  void removeOneFromCart(CartItemModel item) {

    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);
    if (index >= 0) {
     if(cartItems[index].quantity > 1){
       cartItems[index].quantity -= 1;
     }else{
       cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems.removeAt(index) ;
     }
     updateCart() ;
    }
  }

  void removeFromCartDialog (int index){
    Get.defaultDialog(
      title: 'Remove Product' ,
      middleText: 'Are you sure you want to remove this product?' ,
      onConfirm: (){
        cartItems.removeAt(index) ;
        updateCart() ;
        TLoaders.customToast(message: 'Product removed from the Cart') ;
        Get.back() ;
      } ,
      onCancel: ()=> Get.back() ,

    ) ;
  }

  /// convert from product model to product item
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }
    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice! > 0.0
            ? product.salePrice
            : product.price;
    return CartItemModel(
        productId: product.id,
        quantity: quantity,
        price: price,
        title: product.title,
        variationId: variation.id,
        image: isVariation ? variation.image : product.thumbnail,
        brandName: product.brand != null ? product.brand!.name : '',
        selectedVariation: isVariation ? variation.attributeValues : null);
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;
    for (var item in cartItems) {
      calculatedTotalPrice += (item.price)! * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemString = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instance().saveData('cartItems', cartItemString);
  }

  void loadCartItems() {
    final cartItemString =
        TLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemString != null) {
      cartItems.assignAll(cartItemString
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem ;
  }

  int getVariationQuantityInCart(String productId , String variationId) {
    final foundItem = cartItems
        .firstWhere((item) => item.productId == productId && item.variationId == variationId , orElse: ()=> CartItemModel.empty());
    return foundItem.quantity ;
  }

  void clearCart(){
    productQuantityInCart.value = 0 ;
    cartItems.clear() ;
    updateCart() ;
  }

  void updateAlreadyAddedProductCount(ProductModel product){
    if(product.productType== ProductType.single.toString()){
      productQuantityInCart.value = getProductQuantityInCart(product.id) ;
    } else {
      final variationId = variationController.selectedVariation.value.id ;
      if(variationId.isNotEmpty){
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId) ;
      } else {
        productQuantityInCart.value = 0 ;
      }
    }
  }




}
