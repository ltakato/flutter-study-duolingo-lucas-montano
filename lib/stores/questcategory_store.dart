import 'package:learntech/models/questcategory.dart';
import 'package:mobx/mobx.dart';

part 'questcategory_store.g.dart';

class QuestCategoryStore = _QuestCategoryStore with _$QuestCategoryStore;

abstract class _QuestCategoryStore with Store {
  _QuestCategoryStore({
    ObservableList<QuestCategory> questCategories,
    this.filter = VisibilityFilter.all,
  }) : questCategories = questCategories ?? ObservableList<QuestCategory>();

  final ObservableList<QuestCategory> questCategories;

  ReactionDisposer _disposeSaveReaction;

  @observable
  VisibilityFilter filter;

  @observable
  ObservableFuture<void> loader;

  @computed
  List<QuestCategory> get allCategories =>
      questCategories.toList(growable: false);

  @action
  Future<void> _loadQuestCategories() async {
    final entities = [
      QuestCategory(description: "Dart"),
      QuestCategory(description: "Rust"),
      QuestCategory(description: "VB"),
      QuestCategory(description: "Java"),
      QuestCategory(description: "JS"),
      QuestCategory(description: "Typescript"),
      QuestCategory(description: "Database"),
    ];

    questCategories.addAll(entities.toList());
  }

  Future<void> init() async {
    loader = ObservableFuture(_loadQuestCategories());

    await loader;
  }

  void dispose() => _disposeSaveReaction();
}

enum VisibilityFilter { all, pending, completed }
