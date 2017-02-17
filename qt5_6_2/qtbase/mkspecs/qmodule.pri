QT_BUILD_PARTS += libs tools
QT_QCONFIG_PATH = 

host_build {
    QT_CPU_FEATURES.i386 =  sse sse2
} else {
    QT_CPU_FEATURES.i386 =  sse sse2
}
QT_COORD_TYPE += double
CONFIG += precompile_header pcre force_debug_info debug compile_examples msvc_mp sse2 sse3 ssse3 sse4_1 sse4_2 avx avx2 largefile
EXTRA_LIBS += "-LC:/Program Files (x86)/Microsoft SDKs/Windows/v7.1A/Lib" -lGdi32
EXTRA_INCLUDEPATH += C:/TBuild/Libraries/openssl/Release/include
OPENSSL_LIBS_DEBUG=C:\TBuild\Libraries\openssl_debug\Debug\lib\ssleay32.lib C:\TBuild\Libraries\openssl_debug\Debug\lib\libeay32.lib
OPENSSL_LIBS_RELEASE=C:\TBuild\Libraries\openssl\Release\lib\ssleay32.lib C:\TBuild\Libraries\openssl\Release\lib\libeay32.lib
sql-drivers    += sqlite
styles         += windows fusion windowsxp windowsvista
