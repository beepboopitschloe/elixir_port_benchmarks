use std::io::{self, Write};

fn main() {
    let stdout = io::stdout();
    let mut handle = stdout.lock();
    loop {
        let mut text = String::new();
        match io::stdin().read_line(&mut text) {
            Ok(0) => break,
            //Ok(_size) => println!("Responding to {}", text),
            Ok(_size) => { let _ = handle.write_fmt(format_args!("Responding to {}", text)); }
            Err(_err) => break,
        }
    }
    let _ = handle.flush();
}
