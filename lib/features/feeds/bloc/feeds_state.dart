part of 'feeds_bloc.dart';

/// [FeedsState]
class FeedsState extends Equatable {
  /// [FeedsState] load state
  final LoadState loadState;

  /// [FeedsState] full [AppFeedCategory] list
  final List<AppFeedCategory> fullCategoriesList;

  /// [FeedsState] full [AppFeedTheme] list
  final List<AppFeedTheme> fullFeedsList;

  /// [FeedsState] filtered [AppFeedCategory] list
  final List<AppFeedCategory> filteredCategoriesList;

  /// [FeedsState] filtered [AppFeedTheme] list
  final List<AppFeedTheme> filteredFeedsList;

  /// [FeedsState] search phrase
  final String searchPhrase;

  /// [FeedsState] category ids
  final List<int> categoryIds;

  /// Default [FeedsState] constructor
  const FeedsState({
    required this.loadState,
    required this.fullCategoriesList,
    required this.fullFeedsList,
    required this.filteredCategoriesList,
    required this.filteredFeedsList,
    required this.searchPhrase,
    required this.categoryIds,
  });

  /// Copy with
  FeedsState copyWith({
    LoadState? loadState,
    List<AppFeedCategory>? fullCategoriesList,
    List<AppFeedTheme>? fullFeedsList,
    List<AppFeedCategory>? filteredCategoriesList,
    List<AppFeedTheme>? filteredFeedsList,
    String? searchPhrase,
    List<int>? categoryIds,
  }) {
    return FeedsState(
      loadState: loadState ?? this.loadState,
      fullCategoriesList: fullCategoriesList ?? this.fullCategoriesList,
      fullFeedsList: fullFeedsList ?? this.fullFeedsList,
      filteredCategoriesList:
          filteredCategoriesList ?? this.filteredCategoriesList,
      filteredFeedsList: filteredFeedsList ?? this.filteredFeedsList,
      searchPhrase: searchPhrase ?? this.searchPhrase,
      categoryIds: categoryIds ?? this.categoryIds,
    );
  }

  @override
  List<Object?> get props => [
        loadState,
        fullCategoriesList,
        fullFeedsList,
        filteredCategoriesList,
        filteredFeedsList,
        searchPhrase,
        categoryIds,
      ];

  @override
  String toString() =>
      'FeedsState ($hashCode): {loadState:$loadState | fullCategoriesList: $fullCategoriesList | fullFeedsList: $fullFeedsList | filteredCategoriesList: $filteredCategoriesList | filteredFeedsList: $filteredFeedsList | searchPhrase: $searchPhrase | categoryIds: $categoryIds}\n';
}
