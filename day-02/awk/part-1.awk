BEGIN {
  totalDepth = 0;
  totalDistance = 0;
}

$1 == "forward" { totalDistance += $2; }
$1 == "up" { totalDepth -= $2; }
$1 == "down" { totalDepth += $2 }

END {
  print totalDistance * totalDepth;
}
