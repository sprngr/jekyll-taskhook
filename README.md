# Jekyll-Taskhook

[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)

Jekyll plugin for hooking taks runners into the build process. Kind of experimental.

## Installation

Current method is to copy the contents of this repo to a `_plugins/jekyll-taskhook` dir in your Jekyll project directory.

You can do that manually, or the awesome way:

``` bash
$ cd <jekyll-project-path>
$ git submodule add https://github.com/sprngr/jekyll-taskhook.git _plugins/jekyll-taskhook
```

To use, in your `_config.yml` set the property for your task runner (name written lower case) and then list out the tasks to run during `jekyll build`

Example configuration entry:

``` yaml
gulp:
  - clean
  - concat
  - minify
```

Just do the above with whatever task runner system you choose, assuming it's supported.

### Supported task runners
* gulp
* grunt
* npm
* rake

## Known Caveats

If your tasks used create files, avoid having them written to the root Jekyll directory or else an infinite loop will be caused if you run `jekyll serve`. If you do need to generate files for the build, direct the output to the build destination and be sure to include it in the `keep_files` list in the `_config.yml`.

## Changelog

_v.4.0_
* Oh hey, Rake support. That's cool

_v.3.0_
* Finalized support for NPM scripts

_v0.2.0_
* Got off my butt and added in grunt support

_v0.1.0_
* Initialized Project
* Built Gulp support
* Stubbed out methods for Grunt, NPM, and Rake
* Started working on preparing this for packaging

