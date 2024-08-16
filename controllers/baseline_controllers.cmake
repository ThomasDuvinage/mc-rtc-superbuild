include(${CMAKE_CURRENT_LIST_DIR}/CentroidalControlCollection.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/BaselineFootstepPlanner.cmake)

AddProject(BaselineWalkingController
  GITHUB isri-aist/BaselineWalkingController
  GIT_TAG origin/master
  DEPENDS CentroidalControlCollection BaselineFootstepPlanner ForceControlCollection TrajectoryCollection
)

AddProject(MultiContactController
  GITHUB isri-aist/MultiContactController
  GIT_TAG origin/master
  DEPENDS BaselineWalkingController
)

#AddProject(LocomanipController
#  GITHUB isri-aist/LocomanipController
#  GIT_TAG origin/master
#  DEPENDS BaselineWalkingController CentroidalControlCollection ForceControlCollection)