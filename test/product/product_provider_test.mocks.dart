// Mocks generated by Mockito 5.4.4 from annotations
// in rush/test/product/product_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rush/core/domain/entities/product/product.dart' as _i4;
import 'package:rush/core/domain/entities/review/review.dart' as _i7;
import 'package:rush/core/domain/usecases/product/add_product.dart' as _i8;
import 'package:rush/core/domain/usecases/product/delete_product.dart' as _i10;
import 'package:rush/core/domain/usecases/product/get_list_product.dart' as _i2;
import 'package:rush/core/domain/usecases/product/get_product.dart' as _i5;
import 'package:rush/core/domain/usecases/product/get_product_review.dart'
    as _i6;
import 'package:rush/core/domain/usecases/product/update_product.dart' as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [GetListProduct].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetListProduct extends _i1.Mock implements _i2.GetListProduct {
  MockGetListProduct() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Product>> execute({
    String? search = r'',
    String? orderBy = r'created_at',
    bool? descending = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {
            #search: search,
            #orderBy: orderBy,
            #descending: descending,
          },
        ),
        returnValue: _i3.Future<List<_i4.Product>>.value(<_i4.Product>[]),
      ) as _i3.Future<List<_i4.Product>>);
}

/// A class which mocks [GetProduct].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetProduct extends _i1.Mock implements _i5.GetProduct {
  MockGetProduct() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Product?> execute({required String? productId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#productId: productId},
        ),
        returnValue: _i3.Future<_i4.Product?>.value(),
      ) as _i3.Future<_i4.Product?>);
}

/// A class which mocks [GetProductReview].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetProductReview extends _i1.Mock implements _i6.GetProductReview {
  MockGetProductReview() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i7.Review>> execute({
    required String? productId,
    String? orderBy = r'created_at',
    bool? descending = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {
            #productId: productId,
            #orderBy: orderBy,
            #descending: descending,
          },
        ),
        returnValue: _i3.Future<List<_i7.Review>>.value(<_i7.Review>[]),
      ) as _i3.Future<List<_i7.Review>>);
}

/// A class which mocks [AddProduct].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddProduct extends _i1.Mock implements _i8.AddProduct {
  MockAddProduct() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> execute({required _i4.Product? data}) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#data: data},
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [UpdateProduct].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateProduct extends _i1.Mock implements _i9.UpdateProduct {
  MockUpdateProduct() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> execute({required _i4.Product? data}) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#data: data},
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [DeleteProduct].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteProduct extends _i1.Mock implements _i10.DeleteProduct {
  MockDeleteProduct() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> execute({required String? productId}) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#productId: productId},
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
