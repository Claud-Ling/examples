ifeq ($(__BUILDING_FOR_ARM__),1)
  $(info building for arm)
  CFLAGS += -D__ARM_BUILD__
else ifeq ($(__BUILDING_FOR_X86__),1)
  $(info building for x86)
  CFLAGS += -D__X86_BUILD__
endif

all:
	$(CC) $(CFLAGS)  -shared -fPIC example6.c -o libexample6.so

