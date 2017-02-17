
add_library(Qt5::QICNSPlugin MODULE IMPORTED)

_populate_Gui_plugin_properties(QICNSPlugin RELEASE "imageformats/qicns.lib")
_populate_Gui_plugin_properties(QICNSPlugin DEBUG "imageformats/qicnsd.lib")

list(APPEND Qt5Gui_PLUGINS Qt5::QICNSPlugin)
