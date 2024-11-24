OUTPUT_ARCH(aarch64)
ENTRY(_start)

SECTIONS {
    . = 0x80000; /* Kernel load address */
    .text : {
        *(.text*)
    }
    .rodata : {
        *(.rodata*)
    }
    .data : {
        *(.data*)
    }
    .bss : {
        *(COMMON)
        *(.bss*)
    }
}
