import 'package:flet/flet.dart';
import 'flet_onesignal.dart';


CreateControlFactory createControl = (CreateControlArgs args) {
  switch (args.control.type) {
    case 'flet-onesignal':
      if (args.parent == null) {
        throw ArgumentError('Parent cannot be null');
      }
      return OneSignalControl(
        parent: args.parent!,
        control: args.control,
      );
    default:
      return null;
  }
};


void ensureInitialized() {
  // Required initializations, if any
  // Se houver inicializações necessárias
}
