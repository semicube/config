# Config

## Setup

Clone the repository and run the setup scripts:

```bash
git clone https://github.com/semicube/config.git
cd config

chmod +x setup.sh macos.sh brew/brew.sh vscode/vscode.sh iina/iina.sh

./setup.sh
./macos.sh
./brew/brew.sh
./vscode/vscode.sh
./iina/iina.sh
```

## Git Configuration

This repository uses a `.gitconfig.local` file to keep personal details out of version control. After running the setup scripts, create a `~/.gitconfig.local` file:

```bash
touch ~/.gitconfig.local
```

Then add your details to it:

```ini
[user]
    name = Your Name
    email = your.name@example.com
    # signingkey = YOUR_GPG_KEY_ID
```
