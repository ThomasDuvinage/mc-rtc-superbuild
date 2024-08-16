AddProject(QpSolverCollection
  GITHUB isri-aist/QpSolverCollection
  GIT_TAG origin/master 
  CMAKE_ARGS -DENABLE_QLD=ON
)

AddProject(ForceControlCollection
  GITHUB isri-aist/ForceControlCollection
  GIT_TAG origin/master
  DEPENDS QpSolverCollection mc_rtc
)

AddProject(TrajectoryCollection
  GITHUB isri-aist/TrajectoryCollection
  GIT_TAG origin/master
  DEPENDS SpaceVecAlg
)

AddProject(NMPC
  GITHUB isri-aist/NMPC
  GIT_TAG origin/master
  CMAKE_ARGS -DBUILD_TESTING=OFF
)

AddProject(CentroidalControlCollection
  GITHUB isri-aist/CentroidalControlCollection
  GIT_TAG origin/master
  DEPENDS ForceControlCollection NMPC
)