
add_library(Qt5::QGenericEnginePlugin MODULE IMPORTED)

_populate_Network_plugin_properties(QGenericEnginePlugin RELEASE "bearer/qgenericbearer.lib")
_populate_Network_plugin_properties(QGenericEnginePlugin DEBUG "bearer/qgenericbearerd.lib")

list(APPEND Qt5Network_PLUGINS Qt5::QGenericEnginePlugin)
