CONFIG+= debug static rtti no_plugin_manifest directwrite qpa
host_build {
    QT_ARCH = i386
    QT_TARGET_ARCH = i386
} else {
    QT_ARCH = i386
}
QT_CONFIG += minimal-config small-config medium-config large-config full-config debug_and_release build_all release debug static zlib gif jpeg png freetype harfbuzz build_all accessibility ssl openssl-linked dbus audio-backend directwrite native-gestures qpa concurrent
#versioning 
QT_VERSION = 5.6.2
QT_MAJOR_VERSION = 5
QT_MINOR_VERSION = 6
QT_PATCH_VERSION = 2

QT_EDITION = OpenSource
QT_DEFAULT_QPA_PLUGIN = qwindows
QT_CL_MAJOR_VERSION = Microsoft (R) C/C++-Optimierungscompiler Version 19
QT_CL_MINOR_VERSION = 00
QT_CL_PATCH_VERSION = 24215
