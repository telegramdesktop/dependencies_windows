
add_library(Qt5::QOffscreenIntegrationPlugin MODULE IMPORTED)

_populate_Gui_plugin_properties(QOffscreenIntegrationPlugin RELEASE "platforms/qoffscreen.lib")
_populate_Gui_plugin_properties(QOffscreenIntegrationPlugin DEBUG "platforms/qoffscreend.lib")

list(APPEND Qt5Gui_PLUGINS Qt5::QOffscreenIntegrationPlugin)
