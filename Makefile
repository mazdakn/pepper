CFLAGS += \
	-Wall \
	-Werror \
	-Wno-unused-value \
	-Wno-address-of-packed-member \
	-Wno-pointer-sign \
	-Wno-compare-distinct-pointer-types \
	-fno-stack-protector \
	-O2 \
	-target bpf \
	-emit-llvm \
	-g \
	-I ./libbpf/src/ \
	-I ./libbpf/include/uapi

CC := clang
LD := llc
C_FILES:=dataplane/xdp.c

bpf:
	$(CC) $(CFLAGS) -c $(C_FILES) -o $ bin/xdp.ll
	$(LD) -march=bpf -filetype=obj -o bin/xdp.o bin/xdp.ll

clean:
	rm -f bin/*
