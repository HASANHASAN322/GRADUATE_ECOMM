import 'package:e_comm/utils/constants/image_strings.dart';
import '../../features/shop/models/brand_category_model.dart';
import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/product_attribute_model.dart';
import '../../features/shop/models/product_category_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../features/shop/models/product_variation_model.dart';

class TDummyData {
  // static final List<BannerModel> banners = [
  //   BannerModel(
  //       imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
  //   BannerModel(
  //       imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
  //   BannerModel(
  //       imageUrl: TImages.banner3,
  //       targetScreen: TRoutes.favourites,
  //       active: true),
  //   BannerModel(
  //       imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
  //   BannerModel(
  //       imageUrl: TImages.banner5,
  //       targetScreen: TRoutes.settings,
  //       active: true),
  //   BannerModel(
  //       imageUrl: TImages.banner6,
  //       targetScreen: TRoutes.userAddress,
  //       active: true),
  //   BannerModel(
  //       imageUrl: TImages.banner8,
  //       targetScreen: TRoutes.checkout,
  //       active: false),
  // ];
  //
  // static final List<CategoryModel> categories = [
  //   CategoryModel(
  //       id: '1', image: TImages.sportIcon, isFeatured: true, name: 'Sports'),
  //   CategoryModel(
  //       id: '5',
  //       image: TImages.furnitureIcon,
  //       isFeatured: true,
  //       name: 'Furniture'),
  //   CategoryModel(
  //       id: '2',
  //       image: TImages.electronicsIcon,
  //       isFeatured: true,
  //       name: 'Electronics'),
  //   CategoryModel(
  //       id: '3', image: TImages.clothIcon, isFeatured: true, name: 'Cloth'),
  //   CategoryModel(
  //       id: '4', image: TImages.animalIcon, isFeatured: true, name: 'Animal'),
  //   CategoryModel(
  //       id: '6', image: TImages.shoeIcon, isFeatured: true, name: 'Shoe'),
  //   CategoryModel(
  //       id: '7',
  //       image: TImages.cosmeticsIcon,
  //       isFeatured: true,
  //       name: 'Cosmetics'),
  //   //
  //   CategoryModel(
  //       id: '8',
  //       image: TImages.sportIcon,
  //       isFeatured: false,
  //       name: 'Sports shoes',
  //       parentId: '1'),
  //   CategoryModel(
  //       id: '9',
  //       image: TImages.sportIcon,
  //       isFeatured: false,
  //       name: 'Track suits',
  //       parentId: '1'),
  //   CategoryModel(
  //       id: '10',
  //       image: TImages.sportIcon,
  //       isFeatured: false,
  //       name: 'Sports Equipments',
  //       parentId: '1'),
  //
  //   CategoryModel(
  //       id: '11',
  //       image: TImages.furnitureIcon,
  //       isFeatured: false,
  //       name: 'Bedroom Furniture',
  //       parentId: '5'),
  //   CategoryModel(
  //       id: '12',
  //       image: TImages.furnitureIcon,
  //       isFeatured: false,
  //       name: 'Kitchen Furniture',
  //       parentId: '5'),
  //   CategoryModel(
  //       id: '13',
  //       image: TImages.furnitureIcon,
  //       isFeatured: false,
  //       name: 'Office Furniture',
  //       parentId: '5'),
  //
  //   CategoryModel(
  //       id: '14',
  //       image: TImages.electronicsIcon,
  //       isFeatured: false,
  //       name: 'Laptop',
  //       parentId: '2'),
  //   CategoryModel(
  //       id: '15',
  //       image: TImages.electronicsIcon,
  //       isFeatured: false,
  //       name: 'Mobile',
  //       parentId: '2'),
  //
  //   CategoryModel(
  //       id: '16',
  //       image: TImages.clothIcon,
  //       isFeatured: false,
  //       name: 'Shirts',
  //       parentId: '3'),
  // ];
  //
  // ///
  // ///
  // static final List<BrandModel> brands = [
  //   BrandModel(
  //       id: '1',
  //       image: TImages.nikeLogo,
  //       name: 'Nike',
  //       productsCount: 256,
  //       isFeatured: true),
  //   BrandModel(
  //       id: '2',
  //       image: TImages.adidasLogo,
  //       name: 'Adidas',
  //       productsCount: 95,
  //       isFeatured: true),
  //   BrandModel(
  //       id: '8',
  //       image: TImages.kenwoodLogo,
  //       name: 'Kenwood',
  //       productsCount: 36,
  //       isFeatured: false),
  //   BrandModel(
  //       id: '9',
  //       image: TImages.ikeaLogo,
  //       name: 'Ikea',
  //       productsCount: 36,
  //       isFeatured: false),
  //   BrandModel(
  //       id: '5',
  //       image: TImages.appleLogo,
  //       name: 'Apple',
  //       productsCount: 16,
  //       isFeatured: true),
  //   BrandModel(
  //       id: '10',
  //       image: TImages.acerLogo,
  //       name: 'Acer',
  //       productsCount: 36,
  //       isFeatured: false),
  //   BrandModel(
  //       id: '3',
  //       image: TImages.jordanLogo,
  //       name: 'Jordan',
  //       productsCount: 256,
  //       isFeatured: true),
  //   BrandModel(
  //       id: '4',
  //       image: TImages.pumaLogo,
  //       name: 'Puma',
  //       productsCount: 65,
  //       isFeatured: true),
  //   BrandModel(
  //       id: '6',
  //       image: TImages.zaraLogo,
  //       name: 'Zara',
  //       productsCount: 36,
  //       isFeatured: true),
  //   BrandModel(
  //       id: '7',
  //       image: TImages.electronicsIcon,
  //       name: 'Samsung',
  //       productsCount: 36,
  //       isFeatured: false),
  // ];

  ///
  /// not uploaded
  static final List<BrandCategoryModel> brandCategories = [
    BrandCategoryModel(brandId : '1' , categoryId: '1') ,
    BrandCategoryModel(brandId : '1' , categoryId: '8') ,
    BrandCategoryModel(brandId : '1' , categoryId: '9') ,
    BrandCategoryModel(brandId : '1' , categoryId: '10') ,
    BrandCategoryModel(brandId : '2' , categoryId: '1') ,
    BrandCategoryModel(brandId : '2' , categoryId: '8') ,
    BrandCategoryModel(brandId : '2' , categoryId: '9') ,
    BrandCategoryModel(brandId : '2' , categoryId: '10') ,
    BrandCategoryModel(brandId : '3' , categoryId: '1') ,
    BrandCategoryModel(brandId : '3' , categoryId: '8') ,
    BrandCategoryModel(brandId : '3' , categoryId: '9') ,
    BrandCategoryModel(brandId : '3' , categoryId: '10') ,
    BrandCategoryModel(brandId : '4' , categoryId: '1') ,
    BrandCategoryModel(brandId : '4' , categoryId: '8') ,
    BrandCategoryModel(brandId : '4' , categoryId: '9') ,
    BrandCategoryModel(brandId : '4' , categoryId: '10') ,
    BrandCategoryModel(brandId : '5' , categoryId: '15') ,
    BrandCategoryModel(brandId : '5' , categoryId: '2') ,
    BrandCategoryModel(brandId : '6' , categoryId: '3') ,
    BrandCategoryModel(brandId : '6' , categoryId: '16') ,
    BrandCategoryModel(brandId : '7' , categoryId: '2') ,
    BrandCategoryModel(brandId : '8' , categoryId: '5') ,
    BrandCategoryModel(brandId : '8' , categoryId: '11') ,
    BrandCategoryModel(brandId : '8' , categoryId: '12') ,
    BrandCategoryModel(brandId : '8' , categoryId: '13') ,
    BrandCategoryModel(brandId : '9' , categoryId: '5') ,
    BrandCategoryModel(brandId : '9' , categoryId: '11') ,
    BrandCategoryModel(brandId : '9' , categoryId: '12') ,
    BrandCategoryModel(brandId : '9' , categoryId: '13') ,

  ] ;
  ///
  ///
static final List<ProductCategoryModel> productCategories = [
  ProductCategoryModel(productId : '001' , categoryId: '1') ,
  ProductCategoryModel(productId : '001' , categoryId: '8') ,
  ProductCategoryModel(productId : '004' , categoryId: '3') ,
  ProductCategoryModel(productId : '002' , categoryId: '3') ,
  ProductCategoryModel(productId : '002' , categoryId: '16') ,
  ProductCategoryModel(productId : '003' , categoryId: '3') ,
  ProductCategoryModel(productId : '005' , categoryId: '1') ,
  ProductCategoryModel(productId : '005' , categoryId: '8') ,
  ProductCategoryModel(productId : '040' , categoryId: '2') ,
  ProductCategoryModel(productId : '040' , categoryId: '15') ,
  ProductCategoryModel(productId : '006' , categoryId: '2') ,
  ProductCategoryModel(productId : '007' , categoryId: '4') ,
  ProductCategoryModel(productId : '009' , categoryId: '1') ,
  ProductCategoryModel(productId : '009' , categoryId: '8') ,
  ProductCategoryModel(productId : '010' , categoryId: '1') ,
  ProductCategoryModel(productId : '010' , categoryId: '8') ,
  ProductCategoryModel(productId : '011' , categoryId: '1') ,
  ProductCategoryModel(productId : '011' , categoryId: '8') ,
  ProductCategoryModel(productId : '012' , categoryId: '1') ,
  ProductCategoryModel(productId : '012' , categoryId: '8') ,
  ProductCategoryModel(productId : '013' , categoryId: '1') ,
  ProductCategoryModel(productId : '013' , categoryId: '8') ,

  ProductCategoryModel(productId : '014' , categoryId: '1') ,
  ProductCategoryModel(productId : '014' , categoryId: '9') ,
  ProductCategoryModel(productId : '015' , categoryId: '1') ,
  ProductCategoryModel(productId : '015' , categoryId: '9') ,
  ProductCategoryModel(productId : '016' , categoryId: '1') ,
  ProductCategoryModel(productId : '016' , categoryId: '9') ,
  ProductCategoryModel(productId : '017' , categoryId: '1') ,
  ProductCategoryModel(productId : '017' , categoryId: '9') ,

  ProductCategoryModel(productId : '018' , categoryId: '1') ,
  ProductCategoryModel(productId : '018' , categoryId: '10') ,
  ProductCategoryModel(productId : '019' , categoryId: '1') ,
  ProductCategoryModel(productId : '019' , categoryId: '10') ,
  ProductCategoryModel(productId : '020' , categoryId: '1') ,
  ProductCategoryModel(productId : '020' , categoryId: '10') ,
  ProductCategoryModel(productId : '021' , categoryId: '1') ,
  ProductCategoryModel(productId : '021' , categoryId: '10') ,

  ProductCategoryModel(productId : '022' , categoryId: '5') ,
  ProductCategoryModel(productId : '022' , categoryId: '11') ,
  ProductCategoryModel(productId : '023' , categoryId: '5') ,
  ProductCategoryModel(productId : '023' , categoryId: '11') ,
  ProductCategoryModel(productId : '024' , categoryId: '5') ,
  ProductCategoryModel(productId : '024' , categoryId: '11') ,
  ProductCategoryModel(productId : '025' , categoryId: '5') ,
  ProductCategoryModel(productId : '025' , categoryId: '11') ,

  ProductCategoryModel(productId : '026' , categoryId: '5') ,
  ProductCategoryModel(productId : '026' , categoryId: '12') ,
  ProductCategoryModel(productId : '027' , categoryId: '5') ,
  ProductCategoryModel(productId : '027' , categoryId: '12') ,
  ProductCategoryModel(productId : '028' , categoryId: '5') ,
  ProductCategoryModel(productId : '028' , categoryId: '12') ,

  ProductCategoryModel(productId : '029' , categoryId: '5') ,
  ProductCategoryModel(productId : '029' , categoryId: '13') ,
  ProductCategoryModel(productId : '030' , categoryId: '5') ,
  ProductCategoryModel(productId : '030' , categoryId: '13') ,
  ProductCategoryModel(productId : '031' , categoryId: '5') ,
  ProductCategoryModel(productId : '031' , categoryId: '13') ,
  ProductCategoryModel(productId : '032' , categoryId: '5') ,
  ProductCategoryModel(productId : '032' , categoryId: '13') ,

  ProductCategoryModel(productId : '033' , categoryId: '2') ,
  ProductCategoryModel(productId : '033' , categoryId: '14') ,
  ProductCategoryModel(productId : '034' , categoryId: '2') ,
  ProductCategoryModel(productId : '034' , categoryId: '14') ,
  ProductCategoryModel(productId : '035' , categoryId: '2') ,
  ProductCategoryModel(productId : '035' , categoryId: '14') ,
  ProductCategoryModel(productId : '036' , categoryId: '2') ,
  ProductCategoryModel(productId : '036' , categoryId: '14') ,

  ProductCategoryModel(productId : '037' , categoryId: '2') ,
  ProductCategoryModel(productId : '037' , categoryId: '15') ,
  ProductCategoryModel(productId : '038' , categoryId: '2') ,
  ProductCategoryModel(productId : '038' , categoryId: '15') ,
  ProductCategoryModel(productId : '039' , categoryId: '2') ,
  ProductCategoryModel(productId : '039' , categoryId: '15') ,

  ProductCategoryModel(productId : '008' , categoryId: '2') ,
  ];

  ///
  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green Nike sports shoe',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage1,
        description: 'Green Nike sports shoe',
        brand: BrandModel(
            id: '1',
            image: TImages.nikeLogo,
            name: 'Nike',
            productsCount: 256,
            isFeatured: true),
        images: [
          TImages.productImage1,
          TImages.productImage23,
          TImages.productImage21,
          TImages.productImage9,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage1,
              description: 'Product desc for Green Nike sports shoe',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: TImages.productImage1,
              attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 334,
              image: TImages.productImage21,
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 332,
              image: TImages.productImage21,
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '002',
        title: 'blue T-Shirt',
        stock: 15,
        price: 34,
        isFeatured: true,
        thumbnail: TImages.productImage69,
        description: 'blue T-Shirt for all ages',
        brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'Zara'),
        images: [
          TImages.productImage69,
          TImages.productImage68,
          TImages.productImage5,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Blue', 'Red']),
          ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '003',
        title: 'Leather brown Jacket',
        stock: 15,
        price: 340,
        isFeatured: false,
        thumbnail: TImages.productImage64,
        description: 'Leather brown Jacket desc',
        brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'Zara'),
        images: [
          TImages.productImage64,
          TImages.productImage65,
          TImages.productImage66,
          TImages.productImage67,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Blue', 'Red']),
          ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '004',
        title: 'T-Shirt dry fit',
        stock: 15,
        price: 135,
        isFeatured: false,
        thumbnail: TImages.productImage60,
        description: 'T-Shirt dry fit desc',
        brand: BrandModel(
          id: '6',
          image: TImages.zaraLogo,
          name: 'Zara',
        ),
        images: [
          TImages.productImage64,
          TImages.productImage65,
          TImages.productImage66,
          TImages.productImage67,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Blue', 'Red']),
          ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage60,
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage60,
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 334,
              image: TImages.productImage61,
              attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 332,
              image: TImages.productImage61,
              attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 334,
              image: TImages.productImage62,
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 332,
              image: TImages.productImage62,
              attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '7',
              stock: 0,
              price: 334,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '8',
              stock: 11,
              price: 332,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '005',
        title: 'Nick Air Jordan Shoes',
        stock: 15,
        price: 35,
        isFeatured: false,
        thumbnail: TImages.productImage10,
        description: 'Nick Air Jordan Shoes',
        brand: BrandModel(
            id: '1',
            image: TImages.nikeLogo,
            name: 'Nike',
            productsCount: 256,
            isFeatured: true),
        images: [
          TImages.productImage7,
          TImages.productImage8,
          TImages.productImage9,
          TImages.productImage10,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Orange', 'Black', 'Brown']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 15,
              price: 34,
              salePrice: 12.6,
              image: TImages.productImage8,
              description: 'Nick Air Jordan Shoes',
              attributeValues: {'Color': 'Orange', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 14,
              price: 32,
              image: TImages.productImage7,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 13,
              price: 34,
              image: TImages.productImage9,
              attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 12,
              price: 32,
              image: TImages.productImage7,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '5',
              stock: 14,
              price: 34,
              image: TImages.productImage9,
              attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '006',
        title: 'Samsung Galaxy S9',
        stock: 15,
        price: 750,
        isFeatured: false,
        thumbnail: TImages.productImage11,
        description: 'Samsung Galaxy S9 (64 - 4)',
        brand: BrandModel(
          id: '7',
          image: TImages.appleLogo,
          name: 'Samsung',
        ),
        images: [
          TImages.productImage11,
          TImages.productImage12,
          TImages.productImage13,
          TImages.productImage12,
        ],
        salePrice: 650,
        sku: 'ABR4568',
        categoryId: '2',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Blue', 'Red']),
          ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
        ],
        productType: 'ProductType.single'),
  ];

  ///
}
