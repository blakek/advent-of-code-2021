BEGIN {
  increaseCount = 0;
  windowSize = 3;

  for (i = 0; i < windowSize; i++) {
    depths[i] = 0;
  }
}

function depthSum() {
  sum = 0;

  for (i = 0; i < windowSize; i++) {
    sum += depths[i];
  }

  return sum;
}

NR <= windowSize {
  depths[NR % windowSize] = $1;
}

NR > windowSize {
  previousDepth = depthSum();

  depths[NR % windowSize] = $1;
  currentDepth = depthSum();

  if (currentDepth > previousDepth) {
    increaseCount++;
  }

  previousDepth = currentDepth;
}

END {
  print increaseCount;
}
