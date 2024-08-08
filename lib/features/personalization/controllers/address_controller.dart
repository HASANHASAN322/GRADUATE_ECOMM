import 'package:e_comm/common/widgets/loader/loaders.dart';
import 'package:e_comm/features/personalization/models/address_model.dart';
import 'package:e_comm/features/personalization/screens/address/add_new_address.dart';
import 'package:e_comm/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_comm/utils/helpers/cloud_helper_functions.dart';
import 'package:e_comm/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widgets/texts/section_heading.dart';
import '../../../data/repositories/address/address_repository.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/network_connection/network_connection.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());
  RxBool  refreshData = true.obs;

  /// fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  /// show selected bottom sheet
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(TSize.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TSectionHeading(
                      title: 'Select Address',
                      showActionButton: false,
                    ),
                    FutureBuilder(
                        future: getAllUserAddresses(),
                        builder: (_, snapshot) {
                          final response =
                              TCloudHelperFunctions.checkMultiRecordState(
                                  snapshot: snapshot);
                          if (response != null) return response;

                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => TSingleAddress(
                                  address: snapshot.data![index],
                                  onTap: () async {
                                    await selectAddress(snapshot.data![index]);
                                    Get.back();
                                  }));
                        }),
                    const SizedBox(
                      height: TSize.defaultSpace * 2,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            Get.to(() => const AddNewAddressScreen()),
                        child: const Text('Add New Address'),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  /// select address
  Future selectAddress(AddressModel newSelectedAddress) async {
    // try {
    //   Get.defaultDialog(
    //     title: '',
    //     onWillPop: () async {
    //       return false;
    //     },
    //     barrierDismissible: false,
    //     backgroundColor: Colors.transparent,
    //     content: const CircularProgressIndicator(
    //       color: Colors.white,
    //     ),
    //   );
    //
    //   if (selectedAddress.value.id.isNotEmpty) {
    //     await addressRepository.updateSelectedField(
    //         selectedAddress.value.id, false);
    //   }
    //
    //   newSelectedAddress.selectedAddress = true;
    //   selectedAddress.value = newSelectedAddress;
    //
    //   await addressRepository.updateSelectedField(
    //       selectedAddress.value.id, true);
    //
    //   Get.back();
    // } catch (e) {
    //   TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    //   Get.back() ;
    // }
  }

  /// add new address
  Future addNewAddress() async {
    try {
      /// loading
      TFullScreenLoader.openLoadingDialog(
          'Storing Address...', 'assets/images/lottie/loading.json');

      /// check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// validation
      if (!addressFormKey.currentState!.validate()) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// save address data
      final address = AddressModel(
          id: selectedAddress.value.id,
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
          selectedAddress: true
      );

      final id = await addressRepository.addAddress(address);
      address.id = id;
      selectedAddress(address);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully');

      /// refresh data
      refreshData.toggle();

      /// reset fields
      resetFormFields();

      Navigator.of(Get.context!).pop();
    } catch (e) {
      /// remove loader
      TFullScreenLoader.stopLoading();

      /// show errors to user
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
