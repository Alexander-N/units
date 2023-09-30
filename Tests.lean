import Units

#eval Meter
#eval 10*Meter
#eval 1.4*Meter
#eval -1.4*Meter
#eval -1*Meter
#eval Mile
#eval 3*KiloMeter + 2*Mile
#eval 3*KiloMeter - 2*Mile
#eval 1*Meter / 2

def l := 5*KiloMeter
def t := 15*Second
def v := l / t
#eval v

def compute_acceleration (v: (Quantity Velocity)) (t: (Quantity Time)) : (Quantity Acceleration) :=
  v / t

def a := compute_acceleration v t

-- incompatible units => type error
#check_failure Length + Time
#check_failure compute_acceleration v l

#eval v
-- conversion to km/h
#eval v / (KiloMeter/Hour)
-- conversion to miles/h
#eval v / (Mile/Hour)

#check Pascal
#check 1*Volt + 2*Volt
#eval 1*Volt + 2*Volt

#eval 0*Celsius
-- 273.15
#eval 0*Celsius + 0*Celsius
-- -- 273.15

#eval 1*Celsius
-- -- 274.15

#eval 0*Fahrenheit
-- 225.372

#eval 0*Kelvin / Fahrenheit
-- -459.67

#eval 1*Fahrenheit
-- 225.928

#eval 0*Celsius / Fahrenheit
-- 32

#eval 1*Celsius / Fahrenheit
-- 33,8

#eval 10*Celsius + 30*Fahrenheit

#eval 33.8*Fahrenheit / Celsius
-- 1

#eval (1*Celsius + CelsiusDelta) / Celsius
-- 2

#eval (1*Fahrenheit + FahrenheitDelta) / Fahrenheit
-- 2

#eval (1*FahrenheitDelta + CelsiusDelta)
-- same as
#eval 1/1.8 + 1


-- TODO:
-- Do a proper string representation of units e.g. m/s^2
-- equality
-- different number types
-- test or proof some properties
