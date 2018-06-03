################################################################################
# example1:
################################################################################

#项目生成的可执行文件,
#build system将把$(HOST_BUILD_INSTALL_EXECS)所指定的文件安装到output/host/usr/local路径下
HOST_BUILD_INSTALL_EXECS = example2

# cambricon-host-generic-package宏用于编译X86平台程序时使用
$(eval $(cambricon-host-generic-package))
