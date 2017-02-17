
add_library(Qt5::QMinimalIntegrationPlugin MODULE IMPORTED)

_populate_Gui_plugin_properties(QMinimalIntegrationPlugin RELEASE "platforms/qminimal.lib")
_populate_Gui_plugin_properties(QMinimalIntegrationPlugin DEBUG "platforms/qminimald.lib")

list(APPEND Qt5Gui_PLUGINS Qt5::QMinimalIntegrationPlugin)
