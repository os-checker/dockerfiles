use duct::cmd;

// curl --proto '=https' --tlsv1.2 -LsSf https://github.com/os-checker/MIRAI/releases/download/v1.1.9/mirai-installer.sh | sh
fn main() {
    cmd!(
        "curl",
        "--proto",
        "=https",
        "--tlsv1.2",
        "-LsSf",
        "https://github.com/os-checker/MIRAI/releases/download/v1.1.9/mirai-installer.sh"
    )
    .pipe(cmd!("sh"))
    .run()
    .unwrap();
}
