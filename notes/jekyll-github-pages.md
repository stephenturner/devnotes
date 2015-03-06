# Setting up Jekyll with gh pages

## Resources

* Official Jekyll Docs: http://jekyllrb.com/docs/home/
* Setting up Jekyll to work with project pages: http://jekyllrb.com/docs/github-pages/#project-page-url-structure
* Deploying Jekyll locally with correct CSS links: http://stackoverflow.com/a/8304028/654296
* GH article on using Jekyll with gh-pages: https://help.github.com/articles/using-jekyll-with-pages

## Installation & setup

Basic Installation:

```
gem install jekyll
```

Basic setup:

```
jekyll new mynewsite
cd mynewsite
jekyll --serve
```

Jekyll will render any markdown file with front matter, even if empty.

```
---
layout: page
title: my page title
---
```

## Customization

### Deploying locally

(*Note*: Perhaps instructions below on deploying on gh-pages deprecates this usage?)

As per the SO thread above, can modify the `_includes/head.html` file to add a relative link to CSS. 

```
<link rel="stylesheet" type="text/css" href="{{page.root}}/css/main.css" />
```

Then on each page in the YAML front matter, include an entry to the page's root. I.e. for `mynewsite/lessons/index.md`: 

```
---
layout: page
root: ../
---
```

### Deploying on gh-pages

Modify the `baseurl: ` entry in  `_config.yml` as [discussed here](http://jekyllrb.com/docs/github-pages/#project-page-url-structure). That is, if you're serving at `http://username.github.io/projectname`:

* In `_config.yml`, set the `baseurl` option to `/projectname` – note the leading slash and the absence of a trailing slash.
* When referencing JS or CSS files, do it like this: `{{ site.baseurl }}/path/to/css.css` – note the slash immediately following the variable (just before "path").
* When doing permalinks or internal links, do it like this: `{{ site.baseurl }}{{ post.url }}` – note that there is no slash between the two variables.
* Finally, if you'd like to preview your site before committing/deploying using `jekyll serve`, be sure to pass an empty string to the `--baseurl option`, so that you can view everything at `localhost:4000` normally (without `/projectname` at the beginning): `jekyll serve --baseurl ''`

### Syncing gh-pages with master

Two ways to do this. First, you can add a post-commit hook in `hooks/post-commit`, and made executable with `chmod +x post-commit`. Then symlinked to `.git/hooks` so that every time a commit is made on master the gh-pages branch is kept in sync. Then use `git push --all`.

```bash
#!/bin/sh
git checkout gh-pages
git merge master
git checkout master
```

The problem with this is that if you checkout another branch (e.g. dev), make a commit on that, the post-commit hook will checkout gh-pages, merge master, then checkout master, leaving you on master instead of dev after you committed on dev. 

Another solution to this is to add the following 2 lines to the `[remote "origin"]` section of `.git/config`:

push = +refs/heads/master:refs/heads/gh-pages
push = +refs/heads/master:refs/heads/master

Then every time you `git push` (not `git push origin master`), the local master branch will be pushed to both remote master and remote gh-pages. You don't need to maintain a local gh-pages branch anymore.

### Other customizations

* Added `markdown: redcarpet` to `_config.yml` so that fenced code blocks are rendered. Otherwise you have to use Jekyll's code syntax, which isn't as simple.
* Commented this section in `_includes/header.html` so as to not include every page, but added individual pages as desired:
```
<!-- 
{% for page in site.pages %}
  <a class="page-link" href="{{ page.url | prepend: site.baseurl }}">{{ page.title }}</a>
{% endfor %} 
-->
<a class="page-link" href="{{ site.baseurl }}/about/">About</a>
```
* Edited CSS to define h1:
```css
.post-content h1 {
  font-size: 40px;
  letter-spacing: -1.25px;
}
```
