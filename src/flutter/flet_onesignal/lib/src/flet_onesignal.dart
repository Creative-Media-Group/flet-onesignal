import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flet/flet.dart';


class FletOneSignalControl extends StatefulWidget {
  final Control parent;
  final Control control;
  final FletControlBackend backend;

  const FletOneSignalControl({
    super.key,
    required this.parent,
    required this.control,
    required this.backend
  });

  @override
  FletOneSignalControlState createState() => FletOneSignalControlState();
}


class FletOneSignalControlState extends State<FletOneSignalControl> {
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    _initializeOneSignal();
  }

  Future<void> _initializeOneSignal() async {
    try {
      // Get the control's App ID
      // Obtém o App ID do controle
      final appId = widget.control.attrString('app_id') ?? '';

      // Verify that the application ID was provided
      // Verifica se o App ID foi fornecido
      if (appId.isEmpty) {
        setState(() {
          errorMessage = 'FletOneSignal App ID not provided. | FletOneSignal App ID não fornecido.';
        });

        debugPrint(errorMessage);

        widget.backend.triggerControlEvent(widget.control.id, "error_message", errorMessage);

        return;
      }

      // Start FletOneSignal with App ID
      // Iniciar o FletOneSignal com o App ID
      OneSignal.initialize(appId);

      // Optional Settings
      // Configurações opcionais
      OneSignal.consentRequired(false);
      OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

      setState(() {
          errorMessage = "FletOneSignal initialized successfully! | FletOneSignal inicializado com sucesso!";
      });

      debugPrint(errorMessage);
      widget.backend.triggerControlEvent(widget.control.id, "error_message", errorMessage);

    } catch (e) {

      setState(() {
          errorMessage = "Error initializing FletOneSignal | Erro ao inicializar o FletOneSignal: $e";
      });

      debugPrint(errorMessage);
      widget.backend.triggerControlEvent(widget.control.id, "error_message", errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {

    // Control does not render a visible widget
    // O controle não renderiza um widget visível
    return const SizedBox.shrink();
  }
}
