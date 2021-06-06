pub fn nth(n: u32) -> u32 {
    let mut c = 0;
    let mut s = 2;

    loop {
        if is_prime(s) {
            if c == n {
                break
            }
            c += 1;
        }
        s += 1;
    }

    s
}

fn is_prime(n: u32) -> bool {
    // upper bound is m = √n
    let limit = (n as f32).sqrt() as u32;

    if n <= 1 { return false; }

    for i in 2..limit + 1 {
        if n % i == 0 { return false; }
    }
    true
}