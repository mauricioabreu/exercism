pub fn raindrops(n: u32) -> String {
    let mut sounds = String::new();

    let is_factor = |factor: u32| -> bool { n % factor == 0 };

    if is_factor(3) { sounds.push_str("Pling") };
    if is_factor(5) { sounds.push_str("Plang") };
    if is_factor(7) { sounds.push_str("Plong") };

    if sounds.is_empty() { sounds.push_str(&n.to_string()) };

    sounds
}