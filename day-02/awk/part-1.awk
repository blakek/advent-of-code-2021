BEGIN {
  totalDepth = 0;
  totalDistance = 0;
}

{
  direction = $1;
  change = $2;

  if (direction == "forward") {
    totalDistance += change;
  } else if (direction == "up") {
    totalDepth -= change;
  } else if (direction == "down") {
    totalDepth += change;
  }
}

END {
  print totalDistance * totalDepth;
}
