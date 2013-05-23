set(QTGLIB_LIBRARIES ${QTGLIB_LIBRARY})
set(QTGSTREAMER_LIBRARIES ${QTGSTREAMER_LIBRARY})
set(QTGSTREAMER_UI_LIBRARIES ${QTGSTREAMER_UI_LIBRARY})
set(QTGSTREAMER_UTILS_LIBRARIES ${QTGSTREAMER_UTILS_LIBRARY})
set(QTGSTREAMER_INCLUDES ${QTGSTREAMER_INCLUDE_DIR} ${QT_INCLUDE_DIR} ${Boost_INCLUDE_DIRS})
set(QTGSTREAMER_DEFINITIONS "-DQT_NO_KEYWORDS")

if (CMAKE_COMPILER_IS_GNUCXX)
    execute_process(COMMAND ${CMAKE_CXX_COMPILER} "-dumpversion"
                    RESULT_VARIABLE _GCC_DUMPVERSION_RESULT
                    OUTPUT_VARIABLE _GCC_VERSION
                    ERROR_QUIET
                    OUTPUT_STRIP_TRAILING_WHITESPACE)

    if ((${_GCC_DUMPVERSION_RESULT} EQUAL 0)
        AND (${_GCC_VERSION} VERSION_GREATER 4.4.99)
        AND (NOT QTGSTREAMER_DISABLE_CXX0X))

        if (NOT QTGSTREAMER_FLAGS) # be quiet if we try to find QtGStreamer multiple times
            message(STATUS "GCC 4.5 or later detected. Enabling C++0x support in QTGSTREAMER_FLAGS.")
        endif()
        set(QTGSTREAMER_FLAGS "-std=c++0x")
    endif()
endif()
