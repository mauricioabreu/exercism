use std::collections::BTreeMap;

pub fn transform(h: &BTreeMap<i32, Vec<char>>) -> BTreeMap<char, i32> {
    let mut new_way = BTreeMap::new();

    for (points, letters) in h.iter() {
        for letter in letters.iter() { 
            new_way.insert(letter.to_ascii_lowercase(), *points);
        }
    }

    new_way
}
