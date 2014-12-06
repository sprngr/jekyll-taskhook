## Jekyll-Taskhook

Jekyll plugin for hooking taks runners into the build process

## Installation

Current method is to copy the contents of `_plugins` to your own `_plugins` dir in your project directory.

To use, in your `_config.yml` set the property for your task runner and then list out the tasks to run during `jekyll build`

Example configuration entry:

``` yaml

gulp:
  - clean
  - concat
  - minify
```

## Current Support

* Gulp
* Grunt

## Planned Support

* NPM
* Rake

## Changelog

_v0.2.0_
* Got off my butt and added in grunt support

_v0.1.0_
* Initialized Project
* Built Gulp support
* Stubbed out methods for Grunt, NPM, and Rake
* Started working on preparing this for packaging


***

*WIP, will fill out later. Needed sleep...*

***

