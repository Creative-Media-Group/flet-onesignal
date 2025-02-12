import flet as ft

from flet_onesignal.flet_onesignal import FletOneSignal

ONESIGNAL_APP_ID = 'example-123a-12a3-1a23-abcd1ef23g45'


def main(page: ft.Page):
    onesignal = FletOneSignal(app_id=ONESIGNAL_APP_ID)

    title = ft.Text(
        value='FletOneSignal - Test',
        size=20,
    )

    message = ft.Text(
        value='Push notification message here',
        size=20,
    )

    container = ft.Container(
        expand=True,
        alignment=ft.alignment.center,
        content=ft.Column(
            expand=True,
            alignment=ft.MainAxisAlignment.CENTER,
            controls=[
                title,
                ft.Container(
                    width=page.width * 0.3,
                    content=ft.Divider(color=ft.Colors.BLACK),
                ),
                message
            ]
        )
    )

    page.add(
        onesignal,
        container
    )


if __name__ == "__main__":
    ft.app(target=main)


