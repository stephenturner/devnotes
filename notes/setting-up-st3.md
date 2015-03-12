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