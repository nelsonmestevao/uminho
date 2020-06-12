cmake_minimum_required(VERSION 2.8)

# Project Name
PROJECT(class12)

if (WIN32)
	set(TOOLKITS_FOLDER "" CACHE PATH "Path to toolkits folder")
	include_directories(
		${TOOLKITS_FOLDER}/glew
		${TOOLKITS_FOLDER}/glut
		${TOOLKITS_FOLDER}/devil)
	link_directories(
		${TOOLKITS_FOLDER}/glew
		${TOOLKITS_FOLDER}/glut
		${TOOLKITS_FOLDER}/devil)
else()		


find_package(GLUT REQUIRED)
include_directories(${GLUT_INCLUDE_DIR})
link_directories(${GLUT_LIBRARY_DIRS})
add_definitions(${GLUT_DEFINITIONS})

find_package(OpenGL REQUIRED)
include_directories(${OpenGL_INCLUDE_DIRS})
link_directories(${OpenGL_LIBRARY_DIRS})
add_definitions(${OpenGL_DEFINITIONS})
endif(WIN32)

add_executable(${PROJECT_NAME} main.cpp)

if (WIN32)
	target_link_libraries(${PROJECT_NAME} ${OPENGL_LIBRARIES} glut32 glew32 DevIL)
	file(COPY ${TOOLKITS_FOLDER}/glew/glew32.dll DESTINATION ${CMAKE_BINARY_DIR})
	file(COPY ${TOOLKITS_FOLDER}/glut/glut32.dll DESTINATION ${CMAKE_BINARY_DIR})
	file(COPY ${TOOLKITS_FOLDER}/devil/DevIL.dll DESTINATION ${CMAKE_BINARY_DIR})

else(WIN32)
	target_link_libraries(${PROJECT_NAME} ${OPENGL_LIBRARIES} ${GLUT_LIBRARY})
endif (WIN32)
