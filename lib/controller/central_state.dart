import 'package:mobx/mobx.dart';

import '../main.dart';
part 'central_state.g.dart';

class CentralState = CentralStateBase with _$CentralState;

abstract class CentralStateBase with Store {


  String deviceId="null";


}

//instance of a central state
final centralstate = CentralState();

///RUN TO REFRESH
///if you update state management variable
///flutter packages pub run build_runner build
///OR
///flutter packages pub run build_runner build --delete-conflicting-outputs