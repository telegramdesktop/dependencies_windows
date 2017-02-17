
add_library(Qt5::QWindowsIntegrationPlugin MODULE IMPORTED)

_populate_Gui_plugin_properties(QWindowsIntegrationPlugin RELEASE "platforms/qwindows.lib")
_populate_Gui_plugin_properties(QWindowsIntegrationPlugin DEBUG "platforms/qwindowsd.lib")

list(APPEND Qt5Gui_PLUGINS Qt5::QWindowsIntegrationPlugin)
