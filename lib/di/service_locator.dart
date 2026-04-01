
class ServiceLocator {
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();
  static final ServiceLocator _instance = ServiceLocator._internal();
  
  final Map<Type, dynamic> _services = {};
  
  void register<T>(T instance) {
    _services[T] = instance;
  }
  
  T get<T>() {
    return _services[T] as T;
  }
  
  bool isRegistered<T>() => _services.containsKey(T);
}
