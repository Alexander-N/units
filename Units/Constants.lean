import Units.Units

-- Dimensions
def Time: Dimension := { second := 1 }
def Length: Dimension := { meter := 1 }
def Mass: Dimension := { kilogram := 1 }
def Current: Dimension := { ampere := 1 }
def Temperature: Dimension := { kelvin := 1 }
def Amount: Dimension := { mole := 1 }
def Intensity: Dimension := { candela := 1 }

def Velocity := Length / Time
def Acceleration := Velocity / Time

-- SI base units
def Second: Quantity Time  := {}
def Meter : Quantity Length  := {}
def KiloGram: Quantity Mass  := {}
def Ampere: Quantity Current  := {}
def Kelvin: Quantity Temperature  := {}
def Mole: Quantity Amount := {}
def Candela: Quantity Intensity := {}

-- Prefixes
def Yocto := 1e-24
def Zepto := 1e-21
def Atto  := 1e-18
def Femto := 1e-15
def Pico  := 1e-12
def Nano  := 1e-9
def Micro := 1e-6
def Milli  := 1e-3
def Centi := 1e-2
def Deci  := 1e-1
def Kilo  := 1e3
def Mega  := 1e6
def Giga  := 1e9
def Tera  := 1e12
def Peta  := 1e15
def Exa   := 1e18
def Zetta := 1e21
def Yotta := 1e24

def Joule := KiloGram*Meter^2/Second^2
def Coulomb := Ampere*Second
def Volt := Joule/Coulomb
def Farad := Coulomb^2/Joule
def Newton := KiloGram*Meter/Second^2
def Ohm := Volt/Ampere
def Hertz := Second^(-1)
def Siemens := Ohm^(-1)
def Watt := Joule/Second
def Pascal := Newton/Meter^2

-- Length
def MilliMeter := Milli*Meter
def CentiMeter := Centi*Meter
def KiloMeter := Kilo*Meter
def Mile := 1609.344*Meter
def Foot := 30.48*CentiMeter
def Inch := 2.54*CentiMeter

-- Time
def Minute := 60*Second
def Hour := 60*Minute
def Day := 24*Hour

-- Mass
def Gram := 1e-3*KiloGram
def MilliGram := Milli*Gram

-- Area
def SquareMeter := Meter^2
def Hectare := 1e4*SquareMeter
