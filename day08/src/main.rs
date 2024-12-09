use std::fs;
use std::collections::HashMap;
use std::collections::HashSet;

fn is_antenna(c: char) -> bool {
    return c.is_lowercase() || c.is_uppercase() || c.is_digit(10);
}

fn get_antinodes(antennas: Vec<(i16, i16)>) -> Vec<(i16, i16)> {
    let mut antinodes = Vec::new();
    let mut prev_points: Vec<(i16, i16)> = Vec::new();

    for point in antennas {
        for prev_point in &prev_points[..] {
            let d0 = point.0 - prev_point.0; 
            let d1 = point.1 - prev_point.1;
            antinodes.push((prev_point.0 - d0, prev_point.1 - d1));
            antinodes.push((point.0 + d0, point.1 + d1));
        }
        prev_points.push(point);
    }
    
    return antinodes;
}

fn main() {
    let content = fs::read_to_string("input.txt").expect("could not read puzzle input");
    let mut map_height = 0;
    let mut map_width = 0;

    let mut antennas_by_freq = HashMap::new();

    for (i, line) in content.lines().enumerate() {
        map_height = map_height + 1;
        map_width = line.len() as i16;

        for (j, key) in line.match_indices(is_antenna) {
            let points = antennas_by_freq.entry(key).or_insert_with(|| Vec::new());
            points.push((i as i16, j as i16));
        }
    }

    let unique_locations: HashSet<(i16, i16)> = antennas_by_freq.into_values()
        .flat_map(get_antinodes)
        .filter(|antinode| antinode.0 >= 0 && antinode.0 < map_height && antinode.1 >= 0 && antinode.1 < map_width)
        .collect();

    println!("How many unique locations within the bounds of the map contain an antinode?");
    println!("{}", unique_locations.len());
}
