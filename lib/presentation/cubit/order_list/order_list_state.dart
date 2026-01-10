part of 'order_list_cubit.dart';

abstract class OrderListState {}

final class OrderListInitial extends OrderListState {}

final class OrderListLoading extends OrderListState{
  bool loading = true;
  OrderListLoading({required this.loading});
}

final class OrderListLoaded extends OrderListState{

  final List<CartItem> cartItems;
  final num totalPrice;
  OrderListLoaded({required this.cartItems, required this.totalPrice});
}

final class OrderListError extends OrderListState{
  final String message;
  OrderListError({required this.message});
}
