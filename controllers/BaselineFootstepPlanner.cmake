if(WITH_ROS_SUPPORT AND NOT ROS_IS_ROS2)
  AptInstall(
    ros-${ROS_DISTRO}-tf2-eigen
    ros-${ROS_DISTRO}-sbpl
  )
  set(BaseLineFootstepPlanner_DEPENDS)
else()
  AddProject(sbpl
    GITHUB sbpl/sbpl
    GIT_TAG origin/master
  )
  set(BaseLineFootstepPlanner_DEPENDS DEPENDS sbpl)  
endif()

AddProject(BaselineFootstepPlanner
  GITHUB isri-aist/BaselineFootstepPlanner
  GIT_TAG origin/master
  ${BaseLineFootstepPlanner_DEPENDS}
)
