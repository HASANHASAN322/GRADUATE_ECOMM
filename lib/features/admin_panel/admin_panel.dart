import 'package:e_comm/features/admin_panel/controller/admin_controller.dart';
import 'package:e_comm/utils/constants/colors.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/validators/validation.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primary,
        title: Text(
          "Admin Panel",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Center(
            child: GetBuilder(
              init: AdminController(),
              builder: (controller) {
                return  Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// Product Image
                            controller.image == null
                                ? const SizedBox(
                                    height: 100,
                                    width: 300,
                                    child: Center(
                                      child: Text(
                                        "Upload New Photo",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 220,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image:
                                                MemoryImage(controller.image!),
                                            fit: BoxFit.fill)),
                                  ),
                            const SizedBox(
                              height: TSize.spaceBtwSections,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () => controller.selectImage(),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: TColors.primary),
                                  child: Text(
                                    'Select Image',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  )),
                            ),
                            const SizedBox(
                              height: TSize.spaceBtwInputFields,
                            ),

                            /// count
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Product Count',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: controller.count,
                                        validator: (value) =>
                                            TValidator.validateEmptyText(
                                                'Count', value),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: TSize.spaceBtwInputFields,
                                ),

                                /// price
                                Row(
                                  children: [
                                    Text(
                                      'Product Price',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: controller.price,
                                        validator: (value) =>
                                            TValidator.validateEmptyText(
                                                'Price', value),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: TSize.spaceBtwInputFields,
                                ),

                                /// name
                                Row(
                                  children: [
                                    Text(
                                      'Product Name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: controller.name,
                                        validator: (value) =>
                                            TValidator.validateEmptyText(
                                                'Title', value),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: TSize.spaceBtwInputFields,
                                ),

                                /// desc
                                Row(
                                  children: [
                                    Text(
                                      'Product Description',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: controller.description,
                                        validator: (value) =>
                                            TValidator.validateEmptyText(
                                                'Description', value),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: TSize.spaceBtwInputFields,
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: TSize.spaceBtwSections,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () => controller.uploadProductData(
                                      thumbnail: controller.image,
                                      name: controller.name.text.toString(),
                                      description:
                                          controller.description.text.toString(),
                                      price:
                                          double.parse(controller.price.text),
                                      count: int.parse(controller.count.text)),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: TColors.primary),
                                  child: Text(
                                    'Upload Product',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  )),
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
