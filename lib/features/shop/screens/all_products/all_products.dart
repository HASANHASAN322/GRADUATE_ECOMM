import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/common/widgets/appbar/appbar.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../controllers/all_product_controller.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});


  final String title ;
  final Query? query ;
  final Future<List<ProductModel>>? futureMethod ;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController()) ;
    return  Scaffold(
      appBar: TAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: FutureBuilder(
            builder: (context , snapshot) {
              const loader = TVerticalProductShimmer() ;
              if(snapshot.connectionState == ConnectionState.waiting){
                return loader ;
              }
              if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                return const Center(child: Text('No Data Found'),) ;
              }
              if(snapshot.hasError){
                return const Center(child: Text('Something went wrong.'),) ;
              }
              final products = snapshot.data! ;
              return  TSortableProducts(products: products,);
            },
            future: futureMethod ?? controller.fetchProductsByQuery(query),

          ),
        ),
      ),
    );
  }
}

