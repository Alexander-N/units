import Units.Constants
import Units.Utils

structure TemperatureUnit where
  fromFloat: Float -> Quantity (Temperature)
  toFloat: Quantity (Temperature) -> Float

def fahrenHeitToKelvin (f: Float) : Quantity (Temperature) := {val := (f-32) / 1.8 + 273.15}
def kelvinToFahrenheit (t: Quantity (Temperature)) : Float := (t.val -273.15) * 1.8  + 32

def Fahrenheit: TemperatureUnit := {
  fromFloat := fahrenHeitToKelvin
  toFloat := kelvinToFahrenheit
}

def celsiusToKelvin (f: Float) : Quantity (Temperature) := {val := f + 273.15}
def kelvinToCelsius(t: Quantity (Temperature)) : Float := t.val - 273.15

def Celsius: TemperatureUnit := {
  fromFloat := celsiusToKelvin
  toFloat := kelvinToCelsius
}

-- Just convert it to Kelvin (times) and back (divide by)
-- This means e.g. x / Fahrenheit is different than x / (1*Fahrenheit)

instance [ToFloat α]: HMul α TemperatureUnit (Quantity Temperature) where
  hMul factor temperaturUnit := temperaturUnit.fromFloat factor

instance : HDiv (Quantity Temperature) TemperatureUnit Float where
  hDiv t temperatureUnit := temperatureUnit.toFloat t


-- Since Fahrenheit and Celsius are relative units with offsets,
-- define delta units for differences in temperature.

def CelsiusDelta := 1*Kelvin
def FahrenheitDelta := Kelvin / 1.8
