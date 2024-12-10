use std::fs;
use std::collections::HashMap;
use std::collections::HashSet;

fn is_antenna(c: char) -> bool {
    return c.is_lowercase() || c.is_uppercase() || c.is_digit(10);
}

fn get_antinodes(antennas: Vec<(i16, i16)>, map_height: i16, map_width: i16) -> Vec<(i16, i16)> {
    let mut antinodes = Vec::new();
    let mut prev_points: Vec<(i16, i16)> = Vec::new();

    for point in antennas {
        for prev_point in &prev_points[..] {
            let d0 = point.0 - prev_point.0; 
            let d1 = point.1 - prev_point.1;

            let mut i = point.0;
            let mut j = point.1;

            while i >= 0 && j >= 0 && j < map_width {
                antinodes.push((i, j));
                i = i - d0;
                j = j - d1;
            }

            i = point.0 + d0;
            j = point.1 + d1;

            while i < map_height && j >= 0 && j < map_width {
                antinodes.push((i, j));
                i = i + d0;
                j = j + d1;
            }
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
        .flat_map(|antennas| get_antinodes(antennas, map_height, map_width))
        .collect();

    println!("How many unique locations within the bounds of the map contain an antinode?");
    println!("{}", unique_locations.len());
}
