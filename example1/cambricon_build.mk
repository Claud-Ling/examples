################################################################################
# example1:
################################################################################

#项目生成的可执行文件,
#build system将把$(ARM_BUILD_INSTALL_EXECS)所指定的文件安装到根文件系统的/usr/local路径下
ARM_BUILD_INSTALL_EXECS = example1

# cambricon-arm-generic-package宏用于交叉编译该项目时使用
$(eval $(cambricon-arm-generic-package))
