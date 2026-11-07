;;; ... -*- lexical-binding: t -*-

(add-to-list 'load-path "~/.config/emacs/lisp")
(setq custom-file "~/.config/emacs/.custom.el")
(load custom-file)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(tool-bar-mode 0)
(menu-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode 1)

(setq display-line-numbers-type 'relative)

(keymap-global-set "C-h" #'delete-backward-char)

(load "init.elfeed")
(load "init.tuareg")
(load "init.eglot")
(load "init.company")

