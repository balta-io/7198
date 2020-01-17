import 'package:mobx/mobx.dart';
part 'auth.store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  String name = "";

  @observable
  String picture = "https://placehold.it/80";

  @action
  void setUser(String namePar, String picturePar) {
    name = namePar;
    picture = picturePar;
  }

  @action
  void clearUser() {
    name = "";
    picture = "https://placehold.it/80";
  }
}
