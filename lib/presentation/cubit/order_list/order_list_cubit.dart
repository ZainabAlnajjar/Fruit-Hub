import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/domain/repository/basket_repository.dart';

import '../../../domain/models/cart.dart';


part 'order_list_state.dart';

class OrderListCubit extends Cubit<OrderListState> {
  final BasketRepository repository;

  OrderListCubit({required this.repository}) : super(OrderListInitial());

  Future<void> loadCartItems() async{
    emit(OrderListLoading());
    int totalPrice = 0;
    try{
      final cartItemsList = await repository.getBasketItemsWithDetails();
      for (var item in cartItemsList) {
        totalPrice += item.salad.price * item.quantity;
      }
      emit(OrderListLoaded(cartItems: cartItemsList, totalPrice: totalPrice));

    }catch(e){
      emit(OrderListError(message: e.toString()));
    }

  }

}
