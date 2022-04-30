import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  final CollectionReference _collectionOFCategoryRef =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference _collectionOfProductsRef =
      FirebaseFirestore.instance.collection('products');
  Future<List<QueryDocumentSnapshot<Object?>>> getCategory() async {
    var value = await _collectionOFCategoryRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot<Object?>>> getBestSelling() async {
    var value = await _collectionOfProductsRef.get();
    return value.docs;
  }
}
