# test.nvim

WIP neovim plugin for testing

### Architecture:

Rant about this plugin's architecture

**Runners**:

A runner is an abstraction over a testing framework. Examples:
 - Gradle
 - Rspec
 - Junit

**Executors**:

An executor runs a command either in the background or the foreground. Examples:
 - [plenary-nvim](https://github.com/nvim-lua/plenary.nvim)
 - [vim-dispatch](https://github.com/tpope/vim-dispatch)
 - [floaterm](https://github.com/voldikss/vim-floaterm)

**Publishers**:

Publishers display tests results to the user. Multiple publishers can be enabled
at the same time. Examples:
 - Quickfixlist
 - [nvim-notify](https://github.com/rcarriga/nvim-notify)

### The issue

List of things I want this plugin to do (not definitive)

 - Run tests:
    - Unified way of executing tests across frameworks and languages
    - Test suite/class/method
    - Rerun test (test last)
    - Rerun only failed tests
    - Watch code (rerun tests upon changes)
 - Quickfixlist:
    - Parse output correctly
 - Show tests (ui):
    - Show tests as a tree
    - Show progress
 - Goto tests
    - Goto tests (telescope/fzf prompt would be cool)
    - Find tests for this class/method (code lens maybe)
 - Frameworks:
    - Grade
    - Rspec
    - Jest
