;;; ... -*- lexical-binding: t -*-

(use-package eglot
  :bind (:map eglot-mode-map
	      ("<f7>" . 'eglot-momentary-inlay-hints)))
