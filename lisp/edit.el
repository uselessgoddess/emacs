(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

(use-package eglot
  :bind ("C-c a" . eglot-code-actions))

(setq select-enable-clipboard t)
(setq select-enable-primary t)

(setq save-interprogram-paste-before-kill t)

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  (corfu-quit-no-match 'separator))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package avy
  :ensure t
  :bind
  (("M-j" . avy-goto-char-timer)))
