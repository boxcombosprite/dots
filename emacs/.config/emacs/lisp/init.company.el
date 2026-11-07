;;; ... -*- lexical-binding: t -*-

(use-package company
  :bind (:map company-mode-map
	      ("C-c SPC" . company-complete))
  :hook (prog-mode text-mode)
  :config
  (setq company-idle-delay nil))

