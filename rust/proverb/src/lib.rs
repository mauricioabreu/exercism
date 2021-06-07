pub fn build_proverb(list: &[&str]) -> String {
    match list.is_empty() {
        true => String::new(),
        false => list
            .windows(2)
            .map(|items| format!("For want of a {} the {} was lost.", items[0], items[1]))
            .chain(std::iter::once(format!(
                "And all for the want of a {}.",
                list[0]
            )))
            .collect::<Vec<String>>()
            .join("\n"),
    }
}
