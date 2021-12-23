BEGIN {
  depth = 0;
  distance = 0;
  pitch = 0;
}

$1 == "up" { pitch -= $2; }
$1 == "down" { pitch += $2 }

$1 == "forward" {
  distance += $2;
  depth += $2 * pitch;
}

END {
  print distance * depth;
}
