fn main() {
  let path_string = std::env::args().nth(1).expect("no path given");
  let path = std::path::PathBuf::from(path_string);
  let file_contents = std::fs::read_to_string(path).expect("failed to read file");

  let start_point = (0, 0);

  let (distance, depth) = file_contents.lines().fold(
    start_point,
    |(current_distance, current_depth), line_text| {
      let (instruction, argument) = line_text.split_once(" ").unwrap_or(("", ""));
      let argument = argument
        .parse::<i32>()
        .expect("argument should be an integer");

      match (instruction, argument) {
        ("forward", amount) => Ok((current_distance + amount, current_depth)),
        ("up", amount) => Ok((current_distance, current_depth - amount)),
        ("down", amount) => Ok((current_distance, current_depth + amount)),
        _ => Err("unknown instruction"),
      }
      .unwrap()
    },
  );

  println!("{}", distance * depth);
}
