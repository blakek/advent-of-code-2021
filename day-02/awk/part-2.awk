BEGIN {
  depth = 0;
  distance = 0;
  pitch = 0;
}

{
  command = $1;
  amount = $2;

  if (command == "forward") {
    distance += amount;
    depth += amount * pitch;
  } else if (command == "up") {
    pitch -= amount;
  } else if (command == "down") {
    pitch += amount;
  }
}

END {
  print distance * depth;
}
