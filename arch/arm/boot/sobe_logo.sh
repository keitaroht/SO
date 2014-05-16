arm-none-linux-gnueabi-gcc -static    test.c   -o test
echo test | cpio -o --format=newc > rootfs
qemu-system-arm -M versatilepb -m 128M -kernel zImage -initrd rootfs -append "root=/dev/ram rdinit=/test" -s -S &

# debug
red='\e[0;31m'
yellow='\e[1;33m'
NC='\e[0m' # No Color
echo -e "${red}===== Starting gdb ====="
echo -e " Break points interessantes: "
echo -e "     kuser_cmpxchg_fixup"
echo -e "     arm_syscall"
echo -e "     do_fork"



echo -e " ${yellow}"

arm-none-linux-gnueabi-gdb ../../../vmlinux

echo -e "${red}===== Stopping gdb =====${NC}"