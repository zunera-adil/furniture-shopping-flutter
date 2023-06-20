import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/generated/assets/icons.dart';
import 'package:furniture_shopping_flutter/model/category_tab_model.dart';
import 'package:furniture_shopping_flutter/routes/routes_names.dart';
import 'package:furniture_shopping_flutter/view/home/home_components/custom_show_item_widget.dart';
import '../../generated/assets/images.dart';
import '../../model/item_model.dart';
import 'home_components/custom_category_tabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<CategoryTabModel> tabList = [];

  @override
  void initState() {
    _controller = TabController(vsync: this, length: 6);
    _controller.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  final List<ItemModel> _itemList = [
    ItemModel(
        itemName: "Black Simple Lamp",
        image: [
          AssetsImages.item01Image,
          AssetsImages.item02Image,
          AssetsImages.item03Image
        ],
        price: 12.0,
        rating: 4.5,
        totalReviews: 50,
        description:
            'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. '),
    ItemModel(
        itemName: "Minimal Stand",
        image: [
          AssetsImages.item02Image,
          AssetsImages.item01Image,
          AssetsImages.item03Image
        ],
        price: 25.0,
        rating: 4.5,
        totalReviews: 50,
        description:
            'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. '),
    ItemModel(
        itemName: "Coffee Chair",
        image: [
          AssetsImages.item03Image,
          AssetsImages.item01Image,
          AssetsImages.item02Image,
        ],
        price: 20.0,
        rating: 4.5,
        totalReviews: 50,
        description:
            'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. '),
    ItemModel(
        itemName: "Simple Desk",
        image: [
          AssetsImages.item04Image,
          AssetsImages.item01Image,
          AssetsImages.item03Image
        ],
        price: 50.0,
        rating: 4.5,
        totalReviews: 50,
        description:
            'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. '),
    ItemModel(
        itemName: "Coffee Chair",
        image: [
          AssetsImages.item03Image,
          AssetsImages.item02Image,
          AssetsImages.item01Image
        ],
        price: 20.0,
        rating: 4.5,
        totalReviews: 50,
        description:
            'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. '),
    ItemModel(
        itemName: "Simple Desk",
        image: [
          AssetsImages.item04Image,
          AssetsImages.item02Image,
          AssetsImages.item03Image
        ],
        price: 50.0,
        rating: 4.5,
        totalReviews: 50,
        description:
            'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. '),
  ];

  @override
  Widget build(BuildContext context) {
    tabList = [
      CategoryTabModel(
        image: AssetsIcon.starIcon,
        tabTitle: AppLocalizations.of(context)?.popular ?? '',
      ),
      CategoryTabModel(
        image: AssetsIcon.chairIcon,
        tabTitle: AppLocalizations.of(context)?.chair ?? '',
      ),
      CategoryTabModel(
        image: AssetsIcon.tableIcon,
        tabTitle: AppLocalizations.of(context)?.table ?? '',
      ),
      CategoryTabModel(
        image: AssetsIcon.armChairIcon,
        tabTitle: AppLocalizations.of(context)?.armchair ?? '',
      ),
      CategoryTabModel(
        image: AssetsIcon.bedIcon,
        tabTitle: AppLocalizations.of(context)?.bed ?? '',
      ),
      CategoryTabModel(
        image: AssetsIcon.lampIcon,
        tabTitle: AppLocalizations.of(context)?.lamp ?? '',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: SizedBox(
          height: 20.h,
          width: 20.w,
          child: Image.asset(AssetsIcon.searchIcon),
        ),
        title: Column(
          children: [
            Text(
              AppLocalizations.of(context)?.home_title ?? '',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: const Color(0xff909090),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            Text(
              AppLocalizations.of(context)?.home_subtitle ?? '',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, cartScreenRoute),
              child: Image.asset(AssetsIcon.cartIcon)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 18.h,
            ),
            TabBar(
              controller: _controller,
              indicatorColor: Colors.transparent,
              overlayColor: MaterialStateColor.resolveWith(
                (Set<MaterialState> states) =>
                    Theme.of(context).scaffoldBackgroundColor,
              ),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 25.w, left: 0.0),
              tabs: [
                for (int i = 0; i < tabList.length; i++)
                  HomeCategoryTabBar(
                    imgUrl: tabList[i].image,
                    text: tabList[i].tabTitle,
                    selectedIndex: _controller.index,
                    index: i,
                  ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 157.w / 253.h,
                  crossAxisSpacing: 21.w,
                  mainAxisSpacing: 15.h,
                  crossAxisCount: 2,
                ),
                itemCount: _itemList.length,
                itemBuilder: (BuildContext ctx, index) {
                  return CustomShowItemWidget(itemModel: _itemList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
