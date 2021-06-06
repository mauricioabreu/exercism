pub fn verse(n: u32) -> String {
    format!(
        "{how_many_we_have}.\n{take_or_buy}, {do_we_have_beers}.\n",
        how_many_we_have = how_many_we_have(n),
        take_or_buy = take_or_buy(n),
        do_we_have_beers = do_we_have_beers(n)
    )
}

pub fn sing(start: u32, end: u32) -> String {
    let mut song = (end..=start).rev().fold(String::new(), |mut acc, n| {
        acc.push_str(&(verse(n) + "\n"));
        acc
    });
    song.pop();
    song
}

fn do_we_have_beers(b: u32) -> String {
    match b {
        2 => String::from("1 bottle of beer on the wall"),
        1 => String::from("no more bottles of beer on the wall"),
        0 => String::from("99 bottles of beer on the wall"),
        _ => format!("{} bottles of beer on the wall", b - 1),
    }
}

fn how_many_we_have(b: u32) -> String {
    match b {
        1 => String::from("1 bottle of beer on the wall, 1 bottle of beer"),
        0 => String::from("No more bottles of beer on the wall, no more bottles of beer"),
        _ => format!("{} bottles of beer on the wall, {} bottles of beer", b, b),
    }
}

fn take_or_buy(b: u32) -> String {
    match b {
        0 => String::from("Go to the store and buy some more"),
        1 => String::from("Take it down and pass it around"),
        _ => String::from("Take one down and pass it around"),
    }
}
