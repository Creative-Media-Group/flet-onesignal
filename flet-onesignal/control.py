from flet.core.control import Control


class FletOneSignal(Control):
    def __init__(self, app_id: str):
        super().__init__()
        self.app_id = app_id

    def _get_control_name(self):
        return "flet-onesignal"

    def _before_build_command(self):
        self._set_attr("appId", self.app_id)