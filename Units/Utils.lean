class ToFloat (α : Type u) where
  toFloat : α → Float
open ToFloat

instance : ToFloat Float where
  toFloat n := n
instance : ToFloat Int where
  toFloat := Float.ofInt
instance : ToFloat Nat where
  toFloat := Float.ofNat

instance [ToFloat α]: CoeHead α Float where
  coe x := toFloat x


class ToInt (α : Type u) where
  toInt : α → Int
open ToInt

instance : ToInt Int where
  toInt n := n
instance : ToInt Nat where
  toInt := Int.ofNat


instance [ToInt α]: CoeHead α Int where
  coe x := toInt x

instance [ToInt α]: HPow Float α Float where
  hPow f power := f^(toInt power)


class HPowDep (α β : Type) (γ : outParam (β → Type)) where
  hPow (a : α) (b : β) : γ b
infixr:80 " ^ " => HPowDep.hPow
