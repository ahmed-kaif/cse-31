% Embedded Systems CT-1 Note 
% Kaif Ahmed Khan
# Characteristics of Embedded Systems
1. Complex Algorithms
2. User Interface
3. Real Time 
4. Multirate
5. Manufacturing Cost
6. Power & Energy
7. Size
8. Small Team, Tight Deadline

# Why Microprocessors?
1. Flexible
    Faster to implement and prototype that designing custom logic.
2. Efficient
    Programs run faster and modern cpus can run more instruction per clock cycle.
3. Highly Optimized
    Large team works on making their cpu faster and as a result cpus are optimized.
4. Programmability
5. Software available
6. Multiple Platforms e.g. Arduino, Raspberry Pi
7. Real Time 
8. Low Power and Low Cost

# Internet of Things (IoT) & Cyber-Physical System (CPS)
IoT system is a set of sensors, actuators, and computation units
connected by a network. IoT system monitors, analyzes and evaluates
and acts.

CPS uses computers to build controllers, e.g. feedback control system.

**IoT systems operate at lower sample rates, while CPS run at higher
sample rates. For this, IoT systems are more physically distributed
e.g. a manufacturing plant, but CPS are more closely coupled e.g.
an airplane or automobile.** 

# Edge Computing
Edge computing is a distributed computing framework that brings enterprise
applications closer to data sources such as IoT devices or local edge
servers. This proximity to data at its source can deliver strong business
benefits, including faster insights, improved response times and better
bandwidth availability.


# Embedded System Design Process
## Objectives:
1. Steps of design process
2. Design methodology
    - Why it is important? because:
    - Provides a checklist for optimization and testing
    - Helps automate the process
    - Helps the design team to communicate and coordinate

## Top-Down & Bottom-Up design

- Top-down design flow:
requirement analysis -> specification -> architechture -> components
-> system integration

**Bottom-up design is needed because we don't have a clear insight
of the next step beforehand and decisions at one stage are based on
the estimate of the later stage.**

### Requirements
1. Name
2. Purpose
3. Inputs and Outputs
    - Types of Data: Analog/Digital/Mechanical
    - Data Characteristics: Sample rates
    - Types of I/O devices: Buttons/ADC/DAC/Displays
    - Functions: Detailed Description of what the system does.
4. Performance
5. Manufacturing Cost
6. Power
7. Physical Size and Weight

### Example:
| Name | GPS Moving Map|
| -------------- | --------------- |
| Purpose |  |
| Inputs | |
| Outputs |  |
| Functions |  |
| Performance | |
| Manufacturing Cost |  |
| Power |  |
| Size and Weight |  |


# Pulse Width Modulation (PWM)
[PWM](https://learn.sparkfun.com/tutorials/pulse-width-modulation/all) 

# Serial Peripheral Interface (SPI)
## Further Reading
[Daisy Chaining SPI Devices](https://www.analog.com/en/resources/technical-articles/daisychaining-spi-devices.html) 
[SPI](https://learn.sparkfun.com/tutorials/serial-peripheral-interface-spi/all) 

# Inter Integrated Circuit (I2C)
Inter-integrated Circuit protocol is a protocol intended to allow
multiple peripheral digital integrated circuits to communicate
with one or more controllers.
## Why Use I2C?
- Because serial ports are asynchronous by nature.
So they must agree ahead of time on data rate.And extra start 
and stop rates are added as the data overhead.
- Also the two devices must work at a close rate, otherwise data 
will not be transmitted properly.
- Serial ports require hardware overhead as a result, UART ends 
are complex and difficult to design.
- Limited to only two devices.
- Finally data rate is an issue. Highest baud rate is around 
230400 bps.

## Why Not SPI?
- Needs 4 pins to connect. Each additional peripheral requires 
one additional chip select pin.
- Only one controller is allowed.
- Good for high data rate (10MHz) and full-duplex.
- hardware end is simple to implement, just a shift register.

## I2C
- Requires only 2 wires.
- Supports up to 1008 peripheral devices.
- Allows multiple controllers. (controllers can't talk to each other)
- Data rate between UART and SPI (100kHz to 400kHz)
- For every 8 bits of data 1 extra bit of metadata (ACK/NACK) is transmitted.
- Hardware required to implement I2C is more complex than SPI
but simpler than UART, but can be implemented using software.

### Hardware
I2C bus consist of 2 signals:
1. SDA - Serial Data 
2. SCL - Serial Clock

Clock signal is always generated with current bus controller.
Unlike UART or SPI connections, the I2C bus drivers are "open drain", meaning
that they can pull the corresponding signal line low, but cannot drive it high.
Thus, there can be no bus contention where one device is trying to drive the 
line high while another tries to pull it low, eliminating the potential for 
damage to the drivers or excessive power dissipation in the system.
Each signal line has a pull-up resistor on it, to restore the signal to high 
when no device is asserting it low.
## Further Reading
[I2C](https://learn.sparkfun.com/tutorials/i2c/all) 



