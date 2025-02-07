
if(${WITH_MULTI_CONTACT_CONTROLLER} OR ${WITH_BASELINE_WALKING_CONTROLLER} OR  ${WITH_LOCOMANIP_MANIPULATOR_CONTROLLER})
  include(${CMAKE_CURRENT_LIST_DIR}/CentroidalControlCollection.cmake)
  include(${CMAKE_CURRENT_LIST_DIR}/BaselineFootstepPlanner.cmake)

  AddProject(BaselineWalkingController
    GITHUB isri-aist/BaselineWalkingController
    GIT_TAG origin/master
    DEPENDS CentroidalControlCollection BaselineFootstepPlanner ForceControlCollection TrajectoryCollection
  )

  if(WITH_MULTI_CONTACT_CONTROLLER)
    AddProject(MultiContactController
      GITHUB isri-aist/MultiContactController
      GIT_TAG origin/master
      DEPENDS BaselineWalkingController
    )
  endif()

  if(WITH_LOCOMANIP_MANIPULATOR_CONTROLLER)
    #AddProject(LocomanipController
    #  GITHUB isri-aist/LocomanipController
    #  GIT_TAG origin/master
    #  DEPENDS BaselineWalkingController CentroidalControlCollection ForceControlCollection)
  endif()
endif()