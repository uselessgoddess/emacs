(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'" 
  :config
  (setq rust-format-on-save t))

(add-hook 'rust-mode-hook #'eglot-ensure)
(add-hook 'rust-mode-hook #'rainbow-delimiters-mode)
