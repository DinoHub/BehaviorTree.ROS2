function(add_behavior_plugin)
    set(options "")
    set(oneValueArgs NAME)
    set(multiValueArgs SOURCES DEPENDENCIES)

    cmake_parse_arguments("ARG" "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${ARG_NAME} SHARED
        ${ARG_SOURCES}
    )

    target_compile_definitions(${ARG_NAME} PRIVATE BT_PLUGIN_EXPORT)

    target_include_directories(${ARG_NAME}
    PUBLIC
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
        "$<INSTALL_INTERFACE:include/${PROJECT_NAME}>"
    )

    target_link_libraries(${ARG_NAME}
        ${rclcpp_TARGETS}
        ${behaviortree_cpp_TARGETS}
        ${behaviortree_ros2_TARGETS}
        ${ARG_DEPENDENCIES}
    )

    install(
        TARGETS ${ARG_NAME}
        ARCHIVE DESTINATION share/${PROJECT_NAME}/behaviors
        LIBRARY DESTINATION share/${PROJECT_NAME}/behaviors
        RUNTIME DESTINATION share/${PROJECT_NAME}/behaviors
    )

    ament_export_libraries(${ARG_NAME})

endfunction()

function(add_condition_plugin)
    set(options "")
    set(oneValueArgs NAME)
    set(multiValueArgs SOURCES DEPENDENCIES)

    cmake_parse_arguments("ARG" "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${ARG_NAME} SHARED
        ${ARG_SOURCES}
    )

    target_compile_definitions(${ARG_NAME} PRIVATE BT_PLUGIN_EXPORT)

    target_include_directories(${ARG_NAME}
    PUBLIC
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
        "$<INSTALL_INTERFACE:include/${PROJECT_NAME}>"
    )

    target_link_libraries(${ARG_NAME}
        ${rclcpp_TARGETS}
        ${behaviortree_cpp_TARGETS}
        ${behaviortree_ros2_TARGETS}
        ${ARG_DEPENDENCIES}
    )

    install(
        TARGETS ${ARG_NAME}
        ARCHIVE DESTINATION share/${PROJECT_NAME}/conditions
        LIBRARY DESTINATION share/${PROJECT_NAME}/conditions
        RUNTIME DESTINATION share/${PROJECT_NAME}/conditions
    )

    ament_export_libraries(${ARG_NAME})

endfunction()