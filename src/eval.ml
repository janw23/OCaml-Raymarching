open Vector3

let a = { x = 1. ; y = 4. ; z = 10. }
and b = { x = -3. ; y = 40. ; z = -24. }

let c = a ++ b;;
let c = a ** 5.;;
print_string (string_of_vector3 c)