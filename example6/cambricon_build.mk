
################################################################################
# 声明交叉编译目标
#
# 变量ARM_BUILD_MAKE_OPTS在交叉编译该项目时作为参数传递
# 形如: make $(ARM_BUILD_MAKE_OPTS) -C </path/to/example2>
################################################################################

ARM_BUILD_MAKE_OPTS = \
	__BUILDING_FOR_ARM__=1

# example6没有输出可执行程序
# $(ARM_BUILD_INSTALL_LIBRARIES)列出的文件将被拷贝至
#   - <sysroot>/usr/lib/ 编译时使用
#   - <根文件系统>/usr/lib 运行时使用
# $(ARM_BUILD_INSTALL_HEADERS)列出的文件将被拷贝至
#   - <sysroot>/usr/include/cambricon
ARM_BUILD_INSTALL_EXECS =
ARM_BUILD_INSTALL_LIBRARIES = libexample6.so
ARM_BUILD_INSTALL_HEADERS = inc/example6_api.h

$(eval $(cambricon-arm-generic-package))

################################################################################
# 同时声明为host编译目标, 
# 宏cambricon-arm-generic-package和cambricon-host-generic-package一同声明
# build system会对这个项目进行2次编译
#
# 变量HOST_BUILD_MAKE_OPTS在host编译该项目时作为参数传递
# 形如: make $(HOST_BUILD_MAKE_OPTS) -C </path/to/example2>
################################################################################
HOST_BUILD_MAKE_OPTS = \
	__BUILDING_FOR_X86__=1	\

# example6没有输出可执行程序
# $(HOST_BUILD_INSTALL_LIBRARIES)列出的文件将被拷贝至
#   - <sysroot>/usr/lib/ 编译时使用
#   - output/host/lib 运行时使用
# $(HOST_BUILD_INSTALL_HEADERS)列出的文件将被拷贝至
#   - <sysroot>/usr/include/cambricon
HOST_BUILD_INSTALL_EXECS = 
HOST_BUILD_INSTALL_LIBRARIES = libexample6.so
HOST_BUILD_INSTALL_HEADERS = inc/example6_api.h

$(eval $(cambricon-host-generic-package))


################################################################################
# 注: 变量ARM_BUILD_MAKE_OPTS 和HOST_BUILD_MAKE_OPTS在不需要时为空即可
################################################################################
