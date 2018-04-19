
class LoadAppAction {}

class LoadedAppAction {
  LoadedAppAction(this.isLoading);

  final bool isLoading;

  @override
  String toString() =>
    'LoadedAppAction{isLoading: $isLoading}';
}
