import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant/Models/Plants_Model.dart';

abstract class ShopingEvent {}
abstract class ShopingState{}

class AddTOCart extends ShopingEvent{
  final Plants plant;
  AddTOCart({required this.plant});
}
class DelFromCart extends ShopingEvent{
  final Plants plant;
  DelFromCart({required this.plant});
}

class LoadingState extends ShopingState{}
class SuccessState extends ShopingState{
  final List<Plants> plants;
  SuccessState({required this.plants});
}
class FailState extends ShopingState{
  Object fail;
  FailState({required this.fail});
}
class InitState extends ShopingState{}
class SendToServer extends ShopingState{}


class ShopingBloc extends Bloc<ShopingEvent,ShopingState>{
  ShopingBloc(ShopingState initialState) : super(initialState);

  List<Plants> cartPlants = [];

  @override
  Stream<ShopingState> mapEventToState(ShopingEvent event) async* {
    yield LoadingState();
    try {
      if (event is AddTOCart) {
        cartPlants.add(event.plant);
      }
      if (event is DelFromCart) {
        cartPlants.remove(event.plant);
      }
     yield SuccessState(plants : cartPlants);
    }catch(e){
      yield FailState(fail:e);
    }
  }

}

