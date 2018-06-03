#include <linux/init.h>
#include <linux/module.h>  
#include <linux/kernel.h>

MODULE_LICENSE("Dual BSD/GPL");  

static int example4_subdir2_init(void)
{
    printk(KERN_ALERT "hello,I am example4/n");
    return 0;
}

static void example4_subdir2_exit(void)
{  
    printk(KERN_ALERT "goodbye,kernel/n");
}
module_init(example4_subdir2_init);
module_exit(example4_subdir2_exit);
