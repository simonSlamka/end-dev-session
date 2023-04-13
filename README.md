# End Dev Session

This script helps you to close your workday by checking for unadded files in your Git repositories, prompting you to add, commit, and push changes. Additionally, it offers to close all open code editors.

## Usage

```bash
./close_workday.sh [-r <path_to_directory>]
```

## Options

    `-r <path_to_directory>`
Optional. If provided, the script will process all Git repositories within the specified directory. If not provided, the script will process the current working directory as a Git repository.

## Prereqs

The script assumes you have git installed and configured on your system.
The script is designed to work with the code (Visual Studio Code) and codium (VSCodium) editors. You can modify the script to work with other editors by changing the killall commands.

## Installation

Download or clone the repository containing the close_workday.sh script.
Make the script executable:

    `chmod +x close_workday.sh`

Optionally, you can create an alias or move the script to a location in your $PATH for easier access.

## License

This script is released under the GNU General Public License-3.0 (GPL-3.0).