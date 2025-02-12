from typing import Optional, Callable, Any
from flet.core.constrained_control import ConstrainedControl


class FletOneSignal(ConstrainedControl):
    def __init__(self, app_id: str):
        super().__init__()
        self.app_id = app_id
        self._on_event: Optional[Callable[[Any], None]] = lambda event: None  # Callback vazio padrão

    def _get_control_name(self):
        return "flet_onesignal"

    def _before_build_command(self):
        self._set_attr("app_id", self.app_id)

    # Propriedade para registrar o callback de eventos
    @property
    def on_event(self):
        return self._on_event

    @on_event.setter
    def on_event(self, callback: Callable[[Any], None]):
        self._on_event = callback
        self.update()

    def handle_event(self, event):
        """Chamado quando um evento do Flutter chega ao Flet."""
        print(f"Evento recebido: {event.event_name} - Dados: {event.data}")
        if self._on_event:
            self._on_event(event)
