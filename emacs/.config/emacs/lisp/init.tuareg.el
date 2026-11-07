;;; ... -*- lexical-binding: t -*-

(use-package tuareg
  :bind (:map tuareg-mode-map
	      ("<f1> ." . caml-help))
  :config
  (keymap-unset tuareg-mode-map "C-h" t))

(add-hook 'tuareg-mode-hook
	  (lambda()
	    (setq-local comment-style 'multi-line)
	    (setq-local comment-continue "   ")))
