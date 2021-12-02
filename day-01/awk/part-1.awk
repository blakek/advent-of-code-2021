# Count the number of times a line increase in value
BEGIN {
  previousDepth = 0;
  increaseCount = 0;
}

NR == 1 {
  previousDepth = $1;
}

NR > 1 {
  currentDepth = $1;

  if (currentDepth > previousDepth) {
    increaseCount++;
  }

  previousDepth = currentDepth;
}

END {
  print increaseCount;
}
