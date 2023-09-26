# site

## Install

```
git submodule add 'https://github.com/site-0003/content.git' 'content'
git submodule add 'https://github.com/site-0003/ui-custom.git' 'themes/ui-custom'
git submodule add https://github.com/pkgstore/hugo-ui-blog.git 'themes/ui-blog'
git submodule add https://github.com/pkgstore/hugo-ui-shortcode.git 'themes/ui-shortcode'
```

## Update

```
git submodule update --recursive --remote --merge
```

## Uninstall

```
git submodule deinit -f 'themes/ui-custom'; git rm -r --cached 'themes/ui-custom'; rm -rf '.git/modules/themes/ui-custom'; rm -rf 'themes/ui-custom'
```
