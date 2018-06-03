################################################################################
# example5:
#  在example4的基础上增加了用户程序部分
################################################################################

################################################################################
# 1.宏cambricon-xx-kernel-module 用于告诉build system编译一个内核模块
#   该宏不能单独使用,要与cambricon-xx-generic-package,
#   (原因:在下部结构实现上,cambricon-xx-kernel-module并没有声明一个make target)
# 
# 2. XX_MODULE_MAKE_OPTS在编译时作为参数传递
#
# 3. **重要**: 不需要项目中的makefile来编译内核模块, 只需要实现Kbuild文件即可,
#    Kbuild的语法参考kernel文档Documentation/kbuild/modules.txt
#
# 4. 支持编译多个内核模块ko, 若不在根目录, 可在_MODULE_SUBDIRS中列出
#    当driver源码位于根目录时,则可以不必声明_MODULE_SUBDIRS
#
# 5. build system会将ko文件自动安装到相应目录
#    在host上为output/host/lib/modules/<kernel-version>/extra
#    在arm上为根文件系统下/lib/modules/<kernel-version>/extra
#
################################################################################
ARM_MODULE_MAKE_OPTS = __BUILDING_FOR_ARM__=1

ARM_MODULE_SUBDIRS = \
		.	\
		subdir1	\
		subdir2

ARM_BUILD_MAKE_OPTS = \
		__BUILDING_FOR_ARM__=1

ARM_BUILD_INSTALL_EXECS = example5_user

$(eval $(cambricon-arm-kernel-module))
$(eval $(cambricon-arm-generic-package))



HOST_MODULE_MAKE_OPTS = __BUILDING_FOR_X86__=1

HOST_MODULE_SUBDIRS = \
		.	\
		subdir1	\
		subdir2

HOST_BUILD_MAKE_OPTS = \
		__BUILDING_FOR_X86__=1

HOST_BUILD_INSTALL_EXECS = example5_user

$(eval $(cambricon-host-kernel-module))
$(eval $(cambricon-host-generic-package))
