import 'package:mobx/mobx.dart';
part 'auth.store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  String name = "";

  @observable
  String picture = "https://placehold.it/80";

  @observable
  String token = "https://placehold.it/80";

  @action
  void setUser(String namePar, String picturePar, String tokenPar) {
    name = namePar;
    picture = picturePar;
    token = tokenPar;
  }

  @action
  void clearUser() {
    name = "";
    picture = "https://placehold.it/80";
  }
}
