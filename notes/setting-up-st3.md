# Notes on setting up sublime text 3

## Resources

* <https://blog.generalassemb.ly/sublime-text-3-tips-tricks-shortcuts/>
* [Complete list of settings](http://docs.sublimetext.info/en/latest/reference/settings.html)

## subl on command line

```bash
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
```

## User preference settings

`CMD-,` to open user preferences, then paste in the following. 

```
{
  "draw_white_space": "all",
  "rulers": [80],
  "tab_size": 2,
  "translate_tabs_to_spaces": true
}
```

## Package manager

Install [package control](https://packagecontrol.io/installation) by typing the command on the installation page into the console (CMD-\`).

## Packages

### General

- [Sidebar Enhancements](https://github.com/titoBouzout/SideBarEnhancements)
- [GitSavvy](https://github.com/divmain/GitSavvy)

### Markdown

- [Monokai Extended](https://github.com/jonschlinkert/sublime-monokai-extended): Nice syntax highlighting
  1. Install from package control
  2. Switch themes (`Preferences -> Color Scheme -> User -> Monokai Extended`)
- [Markdown Extended](https://github.com/jonschlinkert/sublime-markdown-extended): Add'l highlighting (YAML, GFM, fenced blocks)
  1. First set up Monokai Extended as above.
  2. Install Markdown Extended via package control.
  3. Activate (open a markdown file, switch language to "Markdown Extended", set to default by `View -> Syntax -> Open all with current extension as... -> Markdown Extended`).
- [Markdown Preview](https://github.com/revolunet/sublimetext-markdown-preview): preview HTML in browser
  1. Install via package control
  2. By default, `CMD-B` will build an HTML file instead of previewing in the browser. To change this, in `Preferences->Package Settings->MarkdownPreview->Settings-User`, add the line: `{"build_action": "browser"}`.
- [LiveReload](https://github.com/dz0ny/LiveReload-sublimetext2/tree/devel): automatically reload preview in browser
  1. Install from the [devel branch](https://github.com/dz0ny/LiveReload-sublimetext2/tree/devel) of the github repo, not from package manager, to get the version that works with ST3.
  2. As in the instructions, enable Simple Reload from the command palette (only when needed).

## Keybindings

### Auto-pair backticks.

Search for the "Auto-pair single quotes" block when editing the default key bindings block. Copy this into the user key bindings, and replace all instances of ' with `.

```
[
    // Auto-pair backticks
  { "keys": ["`"], "command": "insert_snippet", "args": {"contents": "`$0`"}, "context":
    [
      { "key": "setting.auto_match_enabled", "operator": "equal", "operand": true },
      { "key": "selection_empty", "operator": "equal", "operand": true, "match_all": true },
      { "key": "following_text", "operator": "regex_contains", "operand": "^(?:\t| |\\)|]|\\}|>|$)", "match_all": true },
      { "key": "preceding_text", "operator": "not_regex_contains", "operand": "[`a-zA-Z0-9_]$", "match_all": true },
      { "key": "eol_selector", "operator": "not_equal", "operand": "string.quoted.single", "match_all": true }
    ]
  },
  { "keys": ["`"], "command": "insert_snippet", "args": {"contents": "`${0:$SELECTION}`"}, "context":
    [
      { "key": "setting.auto_match_enabled", "operator": "equal", "operand": true },
      { "key": "selection_empty", "operator": "equal", "operand": false, "match_all": true }
    ]
  },
  { "keys": ["`"], "command": "move", "args": {"by": "characters", "forward": true}, "context":
    [
      { "key": "setting.auto_match_enabled", "operator": "equal", "operand": true },
      { "key": "selection_empty", "operator": "equal", "operand": true, "match_all": true },
      { "key": "following_text", "operator": "regex_contains", "operand": "^`", "match_all": true },
      { "key": "selector", "operator": "not_equal", "operand": "punctuation.definition.string.begin", "match_all": true },
      { "key": "eol_selector", "operator": "not_equal", "operand": "string.quoted.single", "match_all": true },
    ]
  },
  { "keys": ["backspace"], "command": "run_macro_file", "args": {"file": "res://Packages/Default/Delete Left Right.sublime-macro"}, "context":
    [
      { "key": "setting.auto_match_enabled", "operator": "equal", "operand": true },
      { "key": "selection_empty", "operator": "equal", "operand": true, "match_all": true },
      { "key": "preceding_text", "operator": "regex_contains", "operand": "`$", "match_all": true },
      { "key": "following_text", "operator": "regex_contains", "operand": "^`", "match_all": true },
      { "key": "selector", "operator": "not_equal", "operand": "punctuation.definition.string.begin", "match_all": true },
      { "key": "eol_selector", "operator": "not_equal", "operand": "string.quoted.single", "match_all": true },
    ]
  }
]
```
