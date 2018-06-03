#include <linux/init.h>
#include <linux/module.h>  
#include <linux/kernel.h>


static int __init example4_init(void)
{
    //printk(KERN_ALERT "hello,I am example4/n");
    return 0;
}

static void __exit example4_exit(void)
{  
    //printk(KERN_ALERT "goodbye,kernel/n");
}

module_init(example4_init);
module_exit(example4_exit);

MODULE_LICENSE("Dual BSD/GPL");  
