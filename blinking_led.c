#define F_CPU 8000000UL //1 MHz
#include <avr/io.h>
#include <util/delay.h>

int main()
{
    DDRB |= (1 << PB5); //Sets Pin5 of PortB as output
    while(1) 
    {
        PORTB ^= (1 << PB5); // Sets PIN5 of PortB High to turn on LED
        _delay_ms(1000);  // Delay of 1s
    }
    return 0;
}  
