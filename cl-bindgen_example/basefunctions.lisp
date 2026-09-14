;; next section imported from file baseFunctions.h

(cffi:defcfun ("INIT" init) :void)

(cffi:defcfun ("ADCVoltageReading" adcvoltage-reading) :int)

(cffi:defcfun ("ToggleChargeDischarge" toggle-charge-discharge) :void)

(cffi:defcfun ("SetLCDMode" set-lcdmode) :void
  (mode :int))

(cffi:defcfun ("SetCapacitorValue" set-capacitor-value) :void
  (value :int))

(cffi:defcfun ("SetInductorValue" set-inductor-value) :void
  (value :int))

(cffi:defcfun ("SetResistorValue" set-resistor-value) :void
  (value :int))

(cffi:defcfun ("Delay_us" delay-us) :void
  (time-us :int))

(cffi:defcfun ("Delay_ms" delay-ms) :void
  (time-ms :int))

(cffi:defcfun ("findTimeConstant" find-time-constant) :int)
