#![no_std]
#![no_main]

use core::{arch::asm, panic::PanicInfo};

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
pub extern "C" fn _start() -> ! {
    let uart_base = 0x09000000 as *mut u8;

	for c in b"Hello, world!\n" {
		unsafe {
			core::ptr::write_volatile(uart_base, *c);
		}
		delay();
	}

	loop {}

}


fn delay() {
    for _ in 0..100000 {
		unsafe {
			asm!("nop");
		}
	}
}
