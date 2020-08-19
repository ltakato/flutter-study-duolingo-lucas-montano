// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questcategory_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuestCategoryStore on _QuestCategoryStore, Store {
  Computed<List<QuestCategory>> _$allCategoriesComputed;

  @override
  List<QuestCategory> get allCategories => (_$allCategoriesComputed ??=
          Computed<List<QuestCategory>>(() => super.allCategories,
              name: '_QuestCategoryStore.allCategories'))
      .value;

  final _$loaderAtom = Atom(name: '_QuestCategoryStore.loader');

  @override
  ObservableFuture<void> get loader {
    _$loaderAtom.reportRead();
    return super.loader;
  }

  @override
  set loader(ObservableFuture<void> value) {
    _$loaderAtom.reportWrite(value, super.loader, () {
      super.loader = value;
    });
  }

  final _$_loadQuestCategoriesAsyncAction =
      AsyncAction('_QuestCategoryStore._loadQuestCategories');

  @override
  Future<void> _loadQuestCategories() {
    return _$_loadQuestCategoriesAsyncAction
        .run(() => super._loadQuestCategories());
  }

  @override
  String toString() {
    return '''
loader: ${loader},
allCategories: ${allCategories}
    ''';
  }
}
