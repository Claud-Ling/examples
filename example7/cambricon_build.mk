
################################################################################
# 声明交叉编译目标
#
# 变量ARM_BUILD_MAKE_OPTS在交叉编译该项目时作为参数传递
# 形如: make $(ARM_BUILD_MAKE_OPTS) -C </path/to/example2>
################################################################################

#BUILD_DEPENDENCIES指明了依赖关系,
#系统会保证:
#   - example6先于本项目编译
#   - 即使使用"make pkg-example7-rebuild"单独编译example7,
#     系统也将检测到依赖关系而先编译example6
ARM_BUILD_DEPENDENCIES = example6

ARM_BUILD_MAKE_OPTS = \
	__BUILDING_FOR_ARM__=1

ARM_BUILD_INSTALL_EXECS = example7

$(eval $(cambricon-arm-generic-package))

################################################################################
# 同时声明为host编译目标, 
# 宏cambricon-arm-generic-package和cambricon-host-generic-package一同声明
# build system会对这个项目进行2次编译
#
# 变量HOST_BUILD_MAKE_OPTS在host编译该项目时作为参数传递
# 形如: make $(HOST_BUILD_MAKE_OPTS) -C </path/to/example2>
################################################################################

#
#注意这里为host-example6
#同一个项目如果同时使用$(eval $(cambricon-arm-generic-package))和$(eval $(cambricon-host-generic-package))
#声明,那么系统会为该项目建立两个targe
#
HOST_BUILD_DEPENDENCIES =host-example6

HOST_BUILD_MAKE_OPTS = \
	__BUILDING_FOR_X86__=1	\

HOST_BUILD_INSTALL_EXECS = example7 

$(eval $(cambricon-host-generic-package))


################################################################################
# 注: 变量ARM_BUILD_MAKE_OPTS 和HOST_BUILD_MAKE_OPTS在不需要时为空即可
################################################################################
