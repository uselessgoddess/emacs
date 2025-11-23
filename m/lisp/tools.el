(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-bury-buffer-function-alist
        '((magit-status-mode . magit-mode-quit-window))))

(global-set-key (kbd "M-s r") 'consult-ripgrep)

(define-key project-prefix-map "f" #'project-find-file)
