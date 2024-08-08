import 'package:e_comm/common/style/spacing_style.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});

  final String image , title , subtitle ;
  final VoidCallback onPressed ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
           padding: TSpacingStyle.paddingWithAppBarHeight *2,
          child: Column(
            children: [
              /// image
              Image(
                image:  AssetImage(image),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSize.spaceBtwSections,) ,

              /// Title & subTitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,) ,
              const SizedBox(height: TSize.spaceBtwItems,) ,
              Text(subtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,) ,
              const SizedBox(height: TSize.spaceBtwSections,) ,

              /// Buttons
              SizedBox(width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(TTexts.tContinue),
                ),) ,


            ],
          ),
        ),
      ),
    );
  }
}
