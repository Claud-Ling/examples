
################################################################################
# 声明交叉编译目标
#
# 变量ARM_BUILD_MAKE_OPTS在交叉编译该项目时作为参数传递
# 形如: make $(ARM_BUILD_MAKE_OPTS) -C </path/to/example2>
################################################################################

ARM_BUILD_MAKE_OPTS = \
	__BUILDING_FOR_ARM__=1

ARM_BUILD_INSTALL_EXECS = example3

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

HOST_BUILD_INSTALL_EXECS = example3 

$(eval $(cambricon-host-generic-package))


################################################################################
# 注: 变量ARM_BUILD_MAKE_OPTS 和HOST_BUILD_MAKE_OPTS在不需要时为空即可
################################################################################
