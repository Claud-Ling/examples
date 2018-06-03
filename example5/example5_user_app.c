#include <stdio.h>

int main(void)
{
#if defined(__X86_BUILD__)
	printf("X86 build\n");
#elif defined(__ARM_BUILD__)
	printf("ARM build\n");
#endif

	return 0;
}
