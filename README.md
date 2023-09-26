# Library Online

## Install site with modules

```bash
git clone --recurse-submodules 'https://github.com/site-0003/site.git' 'lib.onl'
```

## Update modules

```bash
git submodule update --recursive --remote --merge
```

## Uninstall modules

```bash
m='content'; git submodule deinit -f "${m}"; git rm -r --cached "${m}"; rm -rf ".git/modules/${m}"; rm -rf "${m}"; m='ui-custom'; git submodule deinit -f "themes/${m}"; git rm -r --cached "themes/${m}"; rm -rf ".git/modules/themes/${m}"; rm -rf "themes/${m}"; m='ui-blog'; git submodule deinit -f "themes/${m}"; git rm -r --cached "themes/${m}"; rm -rf ".git/modules/themes/${m}"; rm -rf "themes/${m}"; m='ui-shortcode'; git submodule deinit -f "themes/${m}"; git rm -r --cached "themes/${m}"; rm -rf ".git/modules/themes/${m}"; rm -rf "themes/${m}";
```
