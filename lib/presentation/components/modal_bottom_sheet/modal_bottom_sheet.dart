import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

enum TimeFilter {
  all('All'),
  newest('Newest'),
  oldest('Oldest'),
  popularity('Popularity');

  final String displayName; // UI에 표시될 이름
  const TimeFilter(this.displayName);
}

enum RatingFilter {
  /// 1점 (가장 낮은 점수) selected ☆, unselected ★,
  oneStar('1★'),

  /// 2점
  twoStars('2★'),

  /// 3점
  threeStars('3★'),

  /// 4점
  fourStars('4★'),

  /// 5점 (가장 높은 점수)
  fiveStars('5★');

  final String displayName; // UI에 표시될 이름
  const RatingFilter(this.displayName);
}

enum CategoryFilter {
  all('All'),
  cereal('Cereal'),
  vegetables('Vegetables'),
  dinner('Dinner★'),
  chinese('Chinese'),
  localDish('Local Dish'),
  fruit('Fruit'),
  breakfast('Breakfast'),
  spanish('Spanish'),
  lunch('Lunch');

  final String displayName; // UI에 표시될 이름
  const CategoryFilter(this.displayName);
}

// // 사용자가 'Local Dish' 카테고리를 선택했을 경우
// FoodCategory selectedCategory = FoodCategory.localDish;
//
// // 선택된 카테고리의 UI 표시 이름 가져오기
// print(selectedCategory.displayName); // 출력: Local Dish
//
// // UI에서 카테고리에 따라 다른 처리를 할 경우
// if (selectedCategory == FoodCategory.breakfast) {
// print('아침 식사 메뉴를 보여줍니다.');
// } else if (selectedCategory.displayName == 'All') {
// print('모든 메뉴를 보여줍니다.');
// }
//
// // 모든 카테고리를 반복하며 UI 버튼을 생성하는 경우
// for (var category in FoodCategory.values) {
// print('버튼 텍스트: ${category.displayName}');
// }

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({super.key});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  Set<TimeFilter> timeFilters = {};
  Set<RatingFilter> ratingFilters = {};
  Set<CategoryFilter> categoryFilters = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('Filter Search', style: TextStyles.smallTextBold,)),
            SizedBox(height: 20),
            Text('Time', style: TextStyles.smallTextBold,),
            SizedBox(height: 10),
            Wrap(
              spacing: 10.0, // gap between adjacent chips
              runSpacing: 10.0, // gap between lines
              children: TimeFilter.values.map((TimeFilter time) {
                bool userSelected = timeFilters.contains(time);
                return FilterChip(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                  backgroundColor: AppColors.white,
                  selectedColor: AppColors.primary100,
                  showCheckmark: false,
                  side: BorderSide(
                    color: userSelected
                        ? AppColors.primary80
                        : AppColors.primary100,
                  ),
                  label: Text(time.displayName),
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  labelStyle: TextStyle(
                    color: userSelected ? AppColors.white : AppColors.primary80,
                  ),
                  selected: userSelected,
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        timeFilters.add(time);
                      } else {
                        timeFilters.remove(time);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('Rating', style: TextStyles.smallTextBold,),
            SizedBox(height: 10),
            Wrap(
              spacing: 10.0, // gap between adjacent chips
              runSpacing: 10.0, // gap between lines
              children: RatingFilter.values.map((RatingFilter rating) {
                bool userSelected = ratingFilters.contains(rating);
                return FilterChip(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                  backgroundColor: AppColors.white,
                  selectedColor: AppColors.primary100,
                  showCheckmark: false,
                  side: BorderSide(
                    color: userSelected
                        ? AppColors.primary80
                        : AppColors.primary100,
                  ),
                  label: Text(rating.displayName),
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  labelStyle: TextStyle(
                    color: userSelected ? AppColors.white : AppColors.primary80,
                  ),
                  selected: userSelected,
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        ratingFilters.add(rating);
                      } else {
                        ratingFilters.remove(rating);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('Category', style: TextStyles.smallTextBold,),
            SizedBox(height: 10),
            Wrap(
              spacing: 10.0, // gap between adjacent chips
              runSpacing: 10.0, // gap between lines
              children: CategoryFilter.values.map((CategoryFilter category) {
                bool userSelected = categoryFilters.contains(category);
                return FilterChip(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                  backgroundColor: AppColors.white,
                  selectedColor: AppColors.primary100,
                  showCheckmark: false,
                  side: BorderSide(
                    color: userSelected
                        ? AppColors.primary80
                        : AppColors.primary100,
                  ),
                  label: Text(category.displayName),
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  labelStyle: TextStyle(
                    color: userSelected ? AppColors.white : AppColors.primary80,
                  ),
                  selected: userSelected,
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        categoryFilters.add(category);
                      } else {
                        categoryFilters.remove(category);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(174, 37),
                  backgroundColor: AppColors.primary100,
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Filter'),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ModalBottomSheet(),
      ),
    ),
  );
}
