pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    (1..limit).fold(0, |acc, x| {
        if is_factor_of(x, factors) {
            acc + x
        } else {
            acc
        }
    })
}

fn is_factor_of(n: u32, factors: &[u32]) -> bool {
    factors.iter().any(|f| f > &0 && n % f == 0)
}