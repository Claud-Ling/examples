#include <stdio.h>


int api_demo_1(void)
{
#if defined(__X86_BUILD__)
	printf("X86 build\n");
#elif defined(__ARM_BUILD__)
	printf("ARM build\n");
#endif

	return 0;
}

int api_demo_2(void)
{
	printf("r u kidding me?\n");

	return 0;
}
