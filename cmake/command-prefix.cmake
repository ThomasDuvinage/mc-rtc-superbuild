function(GetCommandPrefix VAR WRITE_TO)
  if(NOT WIN32 OR NOT MC_RTC_SUPERBUILD_SET_ENVIRONMENT)
    set(CMAKE_COMMAND_PREFIX ${CMAKE_COMMAND} -E env PATH=$ENV{PATH} CMAKE_PREFIX_PATH=$ENV{CMAKE_PREFIX_PATH} PKG_CONFIG_PATH=$ENV{PKG_CONFIG_PATH})
  endif()
  if(APPLE)
    list(APPEND CMAKE_COMMAND_PREFIX DYLD_LIBRARY_PATH=$ENV{DYLD_LIBRARY_PATH})
  elseif(UNIX)
    list(APPEND CMAKE_COMMAND_PREFIX LD_LIBRARY_PATH=$ENV{LD_LIBRARY_PATH})
  endif()
  if(WITH_ROS_SUPPORT)
    list(APPEND CMAKE_COMMAND_PREFIX
                  ROS_DISTRO=$ENV{ROS_DISTRO}
                  PYTHONPATH=$ENV{PYTHONPATH}
                  ROS_ROOT=$ENV{ROS_ROOT}
                  ROS_ETC_DIR=$ENV{ROS_ETC_DIR}
                  ROS_PARALLEL_JOBS="$ENV{ROS_PARALLEL_JOBS}"
                  ROS_VERSION="${ROS_VERSION}"
    )
    if(ROS_IS_ROS2)
      list(APPEND CMAKE_COMMAND_PREFIX
                    AMENT_PREFIX_PATH=$ENV{AMENT_PREFIX_PATH}
                    COLCON_PREFIX_PATH=$ENV{COLCON_PREFIX_PATH}
      )
    else()
      list(APPEND CMAKE_COMMAND_PREFIX
                    ROS_PACKAGE_PATH=$ENV{ROS_PACKAGE_PATH}
      )
    endif()
  else()
    if(NOT WIN32 OR NOT MC_RTC_SUPERBUILD_SET_ENVIRONMENT)
      list(APPEND CMAKE_COMMAND_PREFIX PYTHONPATH=$ENV{PYTHONPATH})
    endif()
  endif()
  if(EMSCRIPTEN)
    list(PREPEND CMAKE_COMMAND_PREFIX ${CMAKE_COMMAND} -E env "CXXFLAGS=-matomics -s USE_PTHREADS=1 -s DISABLE_EXCEPTION_CATCHING=0" "LDFLAGS=-s USE_PTHREADS=1 -s DISABLE_EXCEPTION_CATCHING=0")
  endif()
  list(TRANSFORM CMAKE_COMMAND_PREFIX REPLACE " " "\\\\ " OUTPUT_VARIABLE CMAKE_COMMAND_PREFIX) # restore backslash before spaces in env variables
  list(JOIN CMAKE_COMMAND_PREFIX " " CMAKE_COMMAND_PREFIX_STR)
  file(WRITE "${WRITE_TO}" ${CMAKE_COMMAND_PREFIX_STR})
  set(${VAR} ${CMAKE_COMMAND} -DCMAKE_PREFIX_FILE=${WRITE_TO} -P ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/scripts/cmake-with-prefix.cmake -- PARENT_SCOPE)
endfunction()
