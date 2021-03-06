solution "Decoda"
    configurations { "Debug", "Release" }
    platforms { "x32", "x64" }

    location "build"
    --debugdir "working"

    defines { "_CRT_SECURE_NO_WARNINGS" }

    configuration "x32"
        defines "WIN32"

    configuration "x64"
        defines "WIN64"

    configuration "Debug"
        defines { "DEBUG" }
        flags { "Symbols" }
        targetdir "bin/debug"

    configuration "Release"
        defines { "NDEBUG" }
        flags { "Optimize" }
        targetdir "bin/release"

    vpaths {
        ["Header Files"] = { "**.h" },
        ["Source Files"] = { "**.cpp" },
        ["Resource Files"] = { "**.rc" },
    }

project "Frontend"
    kind "WindowedApp"
    targetname "Decoda"
    flags { "WinMain" }
    location "build"
    language "C++"
    files {
        "src/Frontend/*.h",
        "src/Frontend/*.cpp",
        "src/Frontend/*.rc",
    }
    includedirs {
        "src/Shared",
        "libs/wxWidgets/include",
        "libs/wxScintilla/include",
        "libs/Update/include",
    }
    libdirs {
        "libs/wxWidgets/lib/vc_lib",
        "libs/wxScintilla/lib",
        "libs/Update/lib",
    }
    links {
        "comctl32",
        "rpcrt4",
        "imagehlp",
        "Update",
        "Shared",
    }

    configuration "Debug"
        includedirs { "libs/wxWidgets/lib/vc_lib/mswd" }
        links {
            "wxbase28d",
            "wxmsw28d_core",
            "wxmsw28d_aui",
            "wxscintillad",
            "wxbase28d_xml",
            "wxexpatd",
            "wxmsw28d_adv",
            "wxmsw28d_qa",
            "wxzlibd",
            "wxmsw28d_richtext",
            "wxmsw28d_html",
            "wxpngd",
        }

    configuration "Release"
        includedirs { "libs/wxWidgets/lib/vc_lib/msw" }
        links {
            "wxbase28",
            "wxmsw28_core",
            "wxmsw28_aui",
            "wxscintilla",
            "wxbase28_xml",
            "wxexpat",
            "wxmsw28_adv",
            "wxmsw28_qa",
            "wxzlib",
            "wxmsw28_richtext",
            "wxmsw28_html",
            "wxpng",
        }

project "LuaInject"
    kind "SharedLib"
    location "build"
    language "C++"
    defines { "TIXML_USE_STL" }
    files {
        "src/LuaInject/*.h",
        "src/LuaInject/*.cpp",
    }
    includedirs {
        "src/Shared",
        "libs/lua/include",
        "libs/LuaPlus/include",
        "libs/tinyxml/include",
        "libs/dbghlp/include",
    }

    links {
        "Shared",
        "psapi",
    }

    configuration "x32"
        libdirs {
            "libs/tinyxml/lib",
            "libs/dbghelp/lib",
        }

    configuration "x64"
        libdirs {
            "libs/tinyxml/lib64",
            "libs/dbghelp/lib64",
        }

    configuration "Debug"
        links { "tinyxmld_STL" }

    configuration "Release"
        links { "tinyxml_STL" }

project "Shared"
    kind "StaticLib"
    location "build"
    language "C++"
    files {
        "src/Shared/*.h",
        "src/Shared/*.cpp",
    }
    includedirs {
    }
    libdirs {
    }
    links {
    }

project "tinyxml_STL"
    kind "StaticLib"
    location "build"
    language "C++"
    defines { "TIXML_USE_STL" }
    files {
        "libs/tinyxml/src/*.h",
        "libs/tinyxml/src/*.cpp",
    }
    excludes {
        "libs/tinyxml/src/xmltest.cpp",
    }

    configuration "x32"
        targetdir "libs/tinyxml/lib"

    configuration "x64"
        targetdir "libs/tinyxml/lib64"

    configuration "Debug"
        targetname "tinyxmld_STL"

    configuration "Release"
        targetname "tinyxml_STL"

project "wxScintilla"
    kind "StaticLib"
    location "build"
    language "C++"
    defines { "_LIB", "__WXMSW__", "__WX__", "SCI_LEXER", "LINK_LEXERS" }
    files {
        "libs/wxScintilla/include/wx/*.h",
        "libs/wxScintilla/src/*.h",
        "libs/wxScintilla/src/*.cpp",
        "libs/wxScintilla/src/scintilla/include/*.h",
        "libs/wxScintilla/src/scintilla/src/*.h",
        "libs/wxScintilla/src/scintilla/src/*.cxx",
    }
    includedirs {
        "libs/wxScintilla/include",
        "libs/wxScintilla/src/scintilla/include",
        "libs/wxScintilla/src/scintilla/src",
        "libs/wxWidgets/include",
        "libs/wxWidgets/lib/vc_lib/msw",
    }

    configuration "x32"
        targetdir "libs/wxScintilla/lib"

    configuration "x64"
        targetdir "libs/wxScintilla/lib64"

    configuration "Debug"
        defines { "__WXDEBUG__" }
        targetname "wxscintillad"

    configuration "Release"
        targetname "wxscintilla"

