part of "consts.dart";

class ThemeApp {
  static ThemeData get lightTheme => ThemeData(
      primaryColor: AppColors.primaryColor,
      iconTheme:
          const IconThemeData(size: Pding.paddingL, color: AppColors.grey),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              textStyle: safeGoogleFont(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: Pding.paddingVbtn, horizontal: Pding.paddingL),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))));
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
      primaryColor: AppColors.primaryColor,
      iconTheme:
          const IconThemeData(size: Pding.paddingL, color: AppColors.grey),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              textStyle: safeGoogleFont(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: Pding.paddingVbtn, horizontal: Pding.paddingL),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))));
}
