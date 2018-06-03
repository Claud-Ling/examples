ifeq ($(__BUILDING_FOR_ARM__),1)
  $(info building for arm)
  CFLAGS += -D__ARM_BUILD__
else ifeq ($(__BUILDING_FOR_X86__),1)
  $(info building for x86)
  CFLAGS += -D__X86_BUILD__
endif

#
# CFLAGS中已包含系统头文件搜索路径 -I....
# LDFLAGS中已包含系统库文件搜索路径 -L...
# 我们直接引用就好,不用操心~
#
all:
	$(CC) $(CFLAGS) $(LDFLAGS) example7.c -lexample6 -o example7

