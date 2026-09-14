#ifndef BASE_FUNCTIONS_H
#define BASE_FUNCTIONS_H
#include <stdio.h>
#include <string.h>
#include <math.h>

// Config
void INIT(void);

// Input
int ADCVoltageReading(void);

// Output
void ToggleChargeDischarge(void);
void SetLCDMode(int mode);
void SetCapacitorValue(int value);
void SetInductorValue(int value);
void SetResistorValue(int value);

// Process
void Delay_us(int time_us);
void Delay_ms(int time_ms);
int findTimeConstant(void);
#endif
