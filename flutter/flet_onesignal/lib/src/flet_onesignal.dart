import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flet/flet.dart';


class OneSignalControl extends StatefulWidget {
  final Control parent;
  final Control control;

  const OneSignalControl({super.key, required this.parent, required this.control});

  @override
  OneSignalControlState createState() => OneSignalControlState();
}


class OneSignalControlState extends State<OneSignalControl> {
  @override
  void initState() {
    super.initState();
    _initializeOneSignal();
  }

  Future<void> _initializeOneSignal() async {
    try {
      // Get the control's App ID
      // Obtém o App ID do controle
      final appId = widget.control.attrString('appId') ?? '';

      // Verify that the application ID was provided
      // Verifica se o App ID foi fornecido
      if (appId.isEmpty) {
        debugPrint("FletOneSignal App ID not provided. | FletOneSignal App ID não fornecido.");
        return;
      }

      // Start FletOneSignal with App ID
      // Iniciar o FletOneSignal com o App ID
      OneSignal.initialize(appId);

      // Optional Settings
      // Configurações opcionais
      OneSignal.consentRequired(false);
      OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

      debugPrint("FletOneSignal initialized successfully! | FletOneSignal inicializado com sucesso!");
    } catch (e) {
      debugPrint("Error initializing FletOneSignal | Erro ao inicializar o FletOneSignal: $e");
    }
  }

  @override
  Widget build(BuildContext context) {

    // Control does not render a visible widget
    // O controle não renderiza um widget visível
    return const SizedBox.shrink();
  }
}
