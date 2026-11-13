# Lab 04 – Task 1: Setup

| Question | Answer |
|---|---|
| Tool and version | GitHub Copilot in VS Code Version: 1.145.3 (Universal) |
| Model | Copilot Fusion (Auto). It picked GPT-5.6 Luna. |
| Start mode and how I switched | It started in Interactive mode with Manual permissions. I switch with the menu under the chat box (Interactive / Plan / Autopilot). |
| What it did without asking | Read files. Ran read-only commands: `find`, `git log`, `git diff`. Wrote a plan file in plan mode. |
| What it asked first | Creating hello.txt. Editing hello.txt. Some longer read commands. A command with a path outside the project (I skipped it). |
| See and undo changes | Source Control panel or `git status`. Keep / Undo in the chat. "Discard Changes" in Source Control. |
| Plan mode | It asked 3 questions, then showed a plan. The plan also wanted to change README.md, which I did not ask for. I rejected it. |
| Fresh session | `+` button in the chat. |
| Context and quota | I did not find a display for the context window. Quota: Copilot icon in the status bar. This task used 1% of my credits. |
| Instruction files | `AGENTS.md` or `.github/copilot-instructions.md` |
| Training setting | Off in my GitHub Copilot settings on github.com. |
| Where plans are saved | `~/.copilot/`, a hidden Copilot folder, not my project. |

## Why this tool

Access and cost: Copilot is free for me with the student license.
Team: my team uses it too.
Integration: it works in VS Code, which I already use.
Data protection: I turned off training, and it asks before it changes files.
Limits: I have a monthly credit limit, and openness is low because it is not open source.