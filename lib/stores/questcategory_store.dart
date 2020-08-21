import 'package:cloud_firestore/cloud_firestore.dart';
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
    questCategories.clear();

    try {
      CollectionReference categories = FirebaseFirestore.instance.collection('categories');
      QuerySnapshot snapshot = await categories.get();

      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((doc) => questCategories.add(QuestCategory(id: doc.id, description: doc.data()["description"])));
      }
    }
    catch(e) {
      print("error fetching data: $e");
    }
  }

  Future<void> init() async {
    loader = ObservableFuture(_loadQuestCategories());

    await loader;
  }

  void dispose() => _disposeSaveReaction();
}

enum VisibilityFilter { all, pending, completed }
