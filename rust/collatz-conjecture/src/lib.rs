pub fn collatz(n: u64) -> Option<u64> {
    calculate_collatz(n, 0)
}

fn calculate_collatz(n: u64, steps: u64) -> Option<u64> {   
    match (n, n % 2) {
        (0, _) => None,
        (1, _) => Some(steps),
        (x, 0) => calculate_collatz(x / 2, steps + 1),
        (x, _) => calculate_collatz(x * 3 + 1, steps + 1)
    }
}