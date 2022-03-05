import 'package:rss_feeder/core/extensions/value_cubit.dart';
import 'package:rss_feeder/features/home/models/home_tab.dart';

/// Home page tabs controller
class HomeTabsNavigatorCubit extends ValueCubit<HomeTab> {
  /// Default [HomeTabsNavigatorCubit] constructor
  HomeTabsNavigatorCubit() : super(HomeTab.home);
}
