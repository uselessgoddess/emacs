(use-package restart-emacs
  :ensure t
  :config
  (setq restart-emacs-restore-frames nil))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-bury-buffer-function-alist
        '((magit-status-mode . magit-mode-quit-window))))

(global-set-key (kbd "M-s r") 'consult-ripgrep)

(define-key project-prefix-map "f" #'project-find-file)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-bury-buffer-function-alist
        '((magit-status-mode . magit-mode-quit-window)))

  (define-key magit-mode-map (kbd "L") #'magit-log)
  (define-key magit-mode-map (kbd "X") #'magit-reset-hard))
