option(WITH_BASELINE_CONTROLLERS "Build baseline controllers for mc_rtc (MCC, BWC, LMC)" OFF)

if(NOT WITH_BASELINE_CONTROLLERS)
  return()
endif()

include(baseline_controllers.cmake)
