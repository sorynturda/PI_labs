# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/cmake-3.31.5-linux-x86_64/bin/cmake

# The command to remove a file.
RM = /opt/cmake-3.31.5-linux-x86_64/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/build-dir

# Include any dependencies generated for this target.
include CMakeFiles/opengl_template.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/opengl_template.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/opengl_template.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/opengl_template.dir/flags.make

CMakeFiles/opengl_template.dir/codegen:
.PHONY : CMakeFiles/opengl_template.dir/codegen

CMakeFiles/opengl_template.dir/main.cpp.o: CMakeFiles/opengl_template.dir/flags.make
CMakeFiles/opengl_template.dir/main.cpp.o: /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/main.cpp
CMakeFiles/opengl_template.dir/main.cpp.o: CMakeFiles/opengl_template.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/build-dir/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/opengl_template.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/opengl_template.dir/main.cpp.o -MF CMakeFiles/opengl_template.dir/main.cpp.o.d -o CMakeFiles/opengl_template.dir/main.cpp.o -c /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/main.cpp

CMakeFiles/opengl_template.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opengl_template.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/main.cpp > CMakeFiles/opengl_template.dir/main.cpp.i

CMakeFiles/opengl_template.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opengl_template.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/main.cpp -o CMakeFiles/opengl_template.dir/main.cpp.s

CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.o: CMakeFiles/opengl_template.dir/flags.make
CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.o: /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/color_spaces/spaces.cpp
CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.o: CMakeFiles/opengl_template.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/build-dir/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.o -MF CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.o.d -o CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.o -c /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/color_spaces/spaces.cpp

CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/color_spaces/spaces.cpp > CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.i

CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/color_spaces/spaces.cpp -o CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.s

CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.o: CMakeFiles/opengl_template.dir/flags.make
CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.o: /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/common/file/file_utils.cpp
CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.o: CMakeFiles/opengl_template.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/build-dir/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.o -MF CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.o.d -o CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.o -c /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/common/file/file_utils.cpp

CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/common/file/file_utils.cpp > CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.i

CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/common/file/file_utils.cpp -o CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.s

CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.o: CMakeFiles/opengl_template.dir/flags.make
CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.o: /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/common/logger/logger.cpp
CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.o: CMakeFiles/opengl_template.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/build-dir/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.o -MF CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.o.d -o CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.o -c /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/common/logger/logger.cpp

CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/common/logger/logger.cpp > CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.i

CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/common/logger/logger.cpp -o CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.s

CMakeFiles/opengl_template.dir/src/common/misc.cpp.o: CMakeFiles/opengl_template.dir/flags.make
CMakeFiles/opengl_template.dir/src/common/misc.cpp.o: /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/common/misc.cpp
CMakeFiles/opengl_template.dir/src/common/misc.cpp.o: CMakeFiles/opengl_template.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/build-dir/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/opengl_template.dir/src/common/misc.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/opengl_template.dir/src/common/misc.cpp.o -MF CMakeFiles/opengl_template.dir/src/common/misc.cpp.o.d -o CMakeFiles/opengl_template.dir/src/common/misc.cpp.o -c /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/common/misc.cpp

CMakeFiles/opengl_template.dir/src/common/misc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opengl_template.dir/src/common/misc.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/common/misc.cpp > CMakeFiles/opengl_template.dir/src/common/misc.cpp.i

CMakeFiles/opengl_template.dir/src/common/misc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opengl_template.dir/src/common/misc.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/common/misc.cpp -o CMakeFiles/opengl_template.dir/src/common/misc.cpp.s

CMakeFiles/opengl_template.dir/src/slider/slider.cpp.o: CMakeFiles/opengl_template.dir/flags.make
CMakeFiles/opengl_template.dir/src/slider/slider.cpp.o: /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/slider/slider.cpp
CMakeFiles/opengl_template.dir/src/slider/slider.cpp.o: CMakeFiles/opengl_template.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/build-dir/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/opengl_template.dir/src/slider/slider.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/opengl_template.dir/src/slider/slider.cpp.o -MF CMakeFiles/opengl_template.dir/src/slider/slider.cpp.o.d -o CMakeFiles/opengl_template.dir/src/slider/slider.cpp.o -c /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/slider/slider.cpp

CMakeFiles/opengl_template.dir/src/slider/slider.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/opengl_template.dir/src/slider/slider.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/slider/slider.cpp > CMakeFiles/opengl_template.dir/src/slider/slider.cpp.i

CMakeFiles/opengl_template.dir/src/slider/slider.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/opengl_template.dir/src/slider/slider.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/src/slider/slider.cpp -o CMakeFiles/opengl_template.dir/src/slider/slider.cpp.s

# Object files for target opengl_template
opengl_template_OBJECTS = \
"CMakeFiles/opengl_template.dir/main.cpp.o" \
"CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.o" \
"CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.o" \
"CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.o" \
"CMakeFiles/opengl_template.dir/src/common/misc.cpp.o" \
"CMakeFiles/opengl_template.dir/src/slider/slider.cpp.o"

# External object files for target opengl_template
opengl_template_EXTERNAL_OBJECTS =

opengl_template: CMakeFiles/opengl_template.dir/main.cpp.o
opengl_template: CMakeFiles/opengl_template.dir/src/color_spaces/spaces.cpp.o
opengl_template: CMakeFiles/opengl_template.dir/src/common/file/file_utils.cpp.o
opengl_template: CMakeFiles/opengl_template.dir/src/common/logger/logger.cpp.o
opengl_template: CMakeFiles/opengl_template.dir/src/common/misc.cpp.o
opengl_template: CMakeFiles/opengl_template.dir/src/slider/slider.cpp.o
opengl_template: CMakeFiles/opengl_template.dir/build.make
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_alphamat.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_aruco.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_barcode.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_bgsegm.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_bioinspired.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_ccalib.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_dnn_objdetect.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_dnn_superres.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_dpm.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_face.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_freetype.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_fuzzy.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_hdf.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_hfs.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_img_hash.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_intensity_transform.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_line_descriptor.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_mcc.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_quality.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_rapid.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_reg.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_rgbd.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_saliency.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_shape.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_stereo.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_structured_light.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_surface_matching.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_tracking.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_viz.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_wechat_qrcode.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_xobjdetect.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_xphoto.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_datasets.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_plot.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_text.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_phase_unwrapping.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_optflow.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_ximgproc.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_video.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_videoio.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_imgcodecs.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_dnn.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.4.5.4d
opengl_template: /usr/lib/x86_64-linux-gnu/libopencv_core.so.4.5.4d
opengl_template: /home/mihnea/.conan2/p/spdlo37dc16c5f4409/p/lib/libspdlog.a
opengl_template: /home/mihnea/.conan2/p/fmt75cf8f8ace42b/p/lib/libfmt.a
opengl_template: CMakeFiles/opengl_template.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/build-dir/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable opengl_template"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/opengl_template.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/opengl_template.dir/build: opengl_template
.PHONY : CMakeFiles/opengl_template.dir/build

CMakeFiles/opengl_template.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/opengl_template.dir/cmake_clean.cmake
.PHONY : CMakeFiles/opengl_template.dir/clean

CMakeFiles/opengl_template.dir/depend:
	cd /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/build-dir && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/build-dir /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/build-dir /home/mihnea/Documents/sem2/PI/image-processing-laboratory_linux_template/build-dir/CMakeFiles/opengl_template.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/opengl_template.dir/depend

