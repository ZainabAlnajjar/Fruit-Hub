import 'package:bloc/bloc.dart';
import 'package:fruit_hub/domain/models/cart.dart';
import 'package:fruit_hub/domain/models/cart_item.dart';

import '../../../domain/repository/salad_repository.dart';

part 'order_list_state.dart';

class OrderListCubit extends Cubit<OrderListState> {
  final SaladRepository repository;

  OrderListCubit({required this.repository}) : super(OrderListInitial());

  Future<void> loadCartItems() async{
    try{
      final cartItems = await repository.getCartItems();
      emit(OrderListLoaded(cartItems: cartItems.cartItem??[], totalPrice: cartItems.totalPrice??0));
      emit(OrderListLoading(loading: false));

      print(cartItems);

    }catch(e){
      emit(OrderListLoading(loading: false));
      emit(OrderListError(message: e.toString()));
    }

  }

  Future<void> deleteCart() async{
    try{
      await repository.deleteCart();
      emit(OrderListLoaded(cartItems: [], totalPrice: 0));
    }catch(e){
      emit(OrderListError(message: e.toString()));
    }
  }
}
