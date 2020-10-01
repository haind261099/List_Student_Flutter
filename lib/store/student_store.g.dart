// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentStore on StudentStoreBase, Store {
  final _$studentsAtom = Atom(name: 'StudentStoreBase.students');

  @override
  ObservableFuture<List<Students>> get students {
    _$studentsAtom.reportRead();
    return super.students;
  }

  @override
  set students(ObservableFuture<List<Students>> value) {
    _$studentsAtom.reportWrite(value, super.students, () {
      super.students = value;
    });
  }

  final _$selectedIndexAtom = Atom(name: 'StudentStoreBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$listTypeAtom = Atom(name: 'StudentStoreBase.listType');

  @override
  bool get listType {
    _$listTypeAtom.reportRead();
    return super.listType;
  }

  @override
  set listType(bool value) {
    _$listTypeAtom.reportWrite(value, super.listType, () {
      super.listType = value;
    });
  }

  final _$StudentStoreBaseActionController =
      ActionController(name: 'StudentStoreBase');

  @override
  Future<dynamic> fetchStudents() {
    final _$actionInfo = _$StudentStoreBaseActionController.startAction(
        name: 'StudentStoreBase.fetchStudents');
    try {
      return super.fetchStudents();
    } finally {
      _$StudentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePage(int index) {
    final _$actionInfo = _$StudentStoreBaseActionController.startAction(
        name: 'StudentStoreBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$StudentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeListType() {
    final _$actionInfo = _$StudentStoreBaseActionController.startAction(
        name: 'StudentStoreBase.changeListType');
    try {
      return super.changeListType();
    } finally {
      _$StudentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
students: ${students},
selectedIndex: ${selectedIndex},
listType: ${listType}
    ''';
  }
}
