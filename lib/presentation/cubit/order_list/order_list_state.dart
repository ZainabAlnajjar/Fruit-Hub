part of 'order_list_cubit.dart';

abstract class OrderListState {}

final class OrderListInitial extends OrderListState {}

final class OrderListLoading extends OrderListState{}

final class OrderListLoaded extends OrderListState{

  final List<Cart> cartItems;
  final int totalPrice;
  OrderListLoaded({required this.cartItems, required this.totalPrice});
}

final class OrderListError extends OrderListState{
  final String message;
  OrderListError({required this.message});
}
