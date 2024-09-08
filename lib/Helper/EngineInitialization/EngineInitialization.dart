class Engine {
  DebugEngineInitializationState _state =
      DebugEngineInitializationState.uninitialized;

  // Getter for the engine state
  DebugEngineInitializationState get state => _state;

  // Simulating the initialization process
  Future<void> initialize() async {
    _state = DebugEngineInitializationState.initialized;
    print('Engine initialized.');

    // Simulate some delay for service initialization
    await Future.delayed(const Duration(seconds: 2));
    _state = DebugEngineInitializationState.initializedServices;
    print('Engine services initialized.');
  }

  // Method to initialize the UI, only if services are initialized
  void initializeEngineUi() {
    if (_state == DebugEngineInitializationState.initializedServices) {
      _state = DebugEngineInitializationState.initializedUi;
      print('Engine UI initialized.');
    } else {
      print('Cannot initialize UI: Engine is not ready.');
    }
  }
}

enum DebugEngineInitializationState {
  uninitialized,
  initialized,
  initializedServices,
  initializedUi,
}
