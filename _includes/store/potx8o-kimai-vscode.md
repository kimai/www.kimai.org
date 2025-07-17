Kimai VSCode is a Visual Studio Code extension that integrates with your Kimai time-tracking system,
letting you **start, stop, and monitor timers without leaving your editor**.

Available on Github: [https://github.com/Bodoque-dios/kimai-vscode](https://github.com/Bodoque-dios/kimai-vscode)

##  Features

**Status Bar Timer**

* Shows the current active timer or idle state in your status bar.
* Updates live with elapsed time.

**Sidebar Webview**

* Start a new timer by selecting:
    * Customer
    * Project
    * Activity
    * Description
    * Tags
* View active timers with the ability to stop them.
* See your 5 most recent timers.

**Secure Token Storage**

* Your Kimai API token is stored securely via the VSCode SecretStorage API.

**Quick Commands**

* **Kimai: Set API Token**
  Prompt to securely store your Kimai API token.
* **Kimai: Open Settings**
  Quickly jump to extension configuration.

## Getting Started

1. Install the extension from the VS Code Marketplace or your `.vsix`.
2. Open VS Code and set your Kimai URL:
    * Open settings (`Ctrl + ,`)
    * Search for `kimai-vscode.url`
3. Set your API token:
    * Open the Command Palette (`Ctrl + Shift + P`) or (`Command + Shift + P`)
    * Run `Kimai: Set API Token`
    * Paste your token
4. You’re ready! Use the **status bar** or **sidebar** to manage your time entries.

### VSCodium

Also on the VSCodium store. But you can install it via bash as well:

```bash
codium --install-extension potx8o.kimai-vscode
```

## Usage Tips

* Click the **status bar clock** to stop the active timer.
* Use the **sidebar** (Activity Bar → *Kimai vscode*) to start new timers and review recent ones.
* Long descriptions will auto-truncate for clarity.
