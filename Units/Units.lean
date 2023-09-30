import Units.Utils

open ToInt
open ToFloat

structure Quantity (dimension: Dimension) where
  val: Float := 1
deriving Repr

structure Dimension where
  second: Int := 0
  meter: Int := 0
  kilogram: Int := 0
  ampere: Int := 0
  kelvin: Int := 0
  mole: Int := 0
  candela: Int := 0
deriving Repr, DecidableEq

instance : Mul Dimension where
  mul x y := {
    second := x.second + y.second,
    meter := x.meter + y.meter,
    kilogram := x.kilogram + y.kilogram,
    ampere := x.ampere + y.ampere,
    kelvin := x.kelvin + y.kelvin,
    mole := x.mole + y.mole,
    candela := x.candela  + y.candela,
  }

instance : Div Dimension where
  div x y := {
    second := x.second - y.second,
    meter := x.meter - y.meter,
    kilogram := x.kilogram - y.kilogram,
    ampere := x.ampere - y.ampere,
    kelvin := x.kelvin - y.kelvin,
    mole := x.mole - y.mole,
    candela := x.candela  - y.candela,
  }

instance [ToInt α]: HPow Dimension α Dimension where
  hPow d power := {
    second := d.second * power,
    meter := d.meter * power,
    kilogram := d.kilogram * power,
    ampere := d.ampere * power,
    kelvin := d.kelvin * power,
    mole := d.mole * power,
    candela := d.candela * power,
  }

instance : Add (Quantity d) where
  add x y := { val := x.val + y.val }

instance : Sub (Quantity d) where
  sub x y := { val := x.val - y.val }

instance {d d': Dimension} : HMul (Quantity d) (Quantity d') (Quantity (d*d')) where
  hMul x y := { val := x.val * y.val }

instance {d d': Dimension} : HDiv (Quantity d) (Quantity d') (Quantity (d/d')) where
  hDiv x y := { val := x.val / y.val }

instance [ToFloat α]: HMul α (Quantity d) (Quantity d) where
  hMul x quantity := { val := x * quantity.val }

instance [ToFloat α]: HDiv (Quantity d) α (Quantity d) where
  hDiv quantity x := { val := quantity.val / x }

instance [ToInt α] {d: Dimension}: HPowDep (Quantity d) α (fun x:α => Quantity (d^x)) where
  hPow quantity x := { val := quantity.val^x }
