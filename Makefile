TARGET = aarch64.json
KERNEL = target/aarch64/release/rustos

build:
	cargo build --release --target $(TARGET)

run: build
	qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -kernel $(KERNEL) -serial mon:stdio

clean:
	cargo clean
