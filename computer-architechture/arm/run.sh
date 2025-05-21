file_name=$1
file_name_ext=$(basename "$file_name")
file_name_no_ext="${file_name_ext%.*}"
msg="GDB server running on localhost:1234"
arm-linux-gnu-as -g -o "$file_name_no_ext.o" $file_name
arm-linux-gnu-ld -g -o a.out "$file_name_no_ext.o"
echo "$msg"
qemu-arm -L /usr/arm-linux-gnueabi/ -g 1234 a.out
