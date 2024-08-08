import 'package:e_comm/common/widgets/appbar/appbar.dart';
import 'package:e_comm/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:e_comm/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/products/rating/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Reviews & Ratings'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Rating and Reviews are verified and are from people who use the same type of device that tou use') ,
              const SizedBox(height: TSize.spaceBtwItems,) ,
              /// Overall product rating
              const TOverallProductRating() ,
              const TRatingBarIndicator(rating: 3.5,) ,
              Text('12.611' , style: Theme.of(context).textTheme.bodySmall,) ,
              const SizedBox(height: TSize.spaceBtwSections,) ,
              /// users Reviews list
              const UserReviewCard() ,
              const UserReviewCard() ,

            ],
          ),
        ),
      ),
    );
  }
}




