COMPILER = avr-gcc
MCU = atmega328p
PORT=/dev/ttyUSB0
OBJCOPY = avr-objcopy
CFLAGS = -Os
BAUDRATE = 57600

program: compile
	avrdude -F -V -c arduino -p $(MCU) -P $(PORT) -b $(BAUDRATE) -U flash:w:blinking_led.hex

compile: blinking_led.elf
	$(OBJCOPY) -O ihex -R .eeprom blinking_led.elf blinking_led.hex

blinking_led.elf: blinking_led.c
	$(COMPILER) -mmcu=$(MCU) -Wall $(CFLAGS) -o blinking_led.elf blinking_led.c

clean:
	rm -f blinking_led.elf blinking_led.hex
