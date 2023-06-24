/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let mut numbers = Vec::new();
    let mut invalid = Vec::new();

    if code.trim().len() <= 1 {
        return false;
    }

    for c in code.chars() {
        match c {
            '0'..='9' => numbers.push(c.to_digit(10).unwrap() as i32),
            ' ' => continue,
            _ => invalid.push(c),
        }
    }

    if !invalid.is_empty() {
        return false;
    }

    numbers
        .iter_mut()
        .rev()
        .enumerate()
        .filter(|(i, _)| i % 2 == 1)
        .for_each(|(_, num)| {
            *num *= 2;
            if *num > 9 {
                *num -= 9;
            }
        });

    numbers.iter().sum::<i32>() % 10 == 0
}
