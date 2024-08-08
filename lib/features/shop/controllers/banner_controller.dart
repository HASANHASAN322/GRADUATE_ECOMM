import 'package:e_comm/data/repositories/banners/banner_reposiory.dart';
import 'package:e_comm/features/shop/models/banner_model.dart';
import 'package:get/get.dart';
import '../../../common/widgets/loader/loaders.dart';

class BannerController extends GetxController{
  static BannerController get instance => Get.find() ;

  /// variables
  final carousalCurrentIndex = 0.obs ;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners() ;
    super.onInit() ;
  }

  /// update page banners
  void updatePageIndicator(index){
    carousalCurrentIndex.value = index ;
  }

  /// fetch banners
  Future<void> fetchBanners() async {
    try {
      /// show loader
      isLoading.value = true;

      final bannerRepo = Get.put(BannerRepository()) ;
      final banners = await bannerRepo.fetchBanners() ;

      /// Assign Banners
      this.banners.assignAll(banners) ;

      update();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}