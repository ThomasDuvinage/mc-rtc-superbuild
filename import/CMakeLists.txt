# Drop your own .cmake files (or extension-style folders) here to locally override or
# add dependencies without editing the superbuild or its extensions. Files in this
# folder (other than this one) are gitignored. See README.md ("Overriding
# dependencies locally") for details.
file(GLOB extension_dirs CONFIGURE_DEPENDS "*")
foreach(extension_dir ${extension_dirs})
  if(EXISTS "${extension_dir}/CMakeLists.txt")
    addextension(${extension_dir})
  endif()
  if(extension_dir MATCHES ".cmake$")
    include(${extension_dir})
  endif()
endforeach()
