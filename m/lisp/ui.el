;; smooth scroll
(pixel-scroll-precision-mode 1)
(setq-default truncate-lines t)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(dolist (mode '(term-mode-hook
                shell-mode-hook
                eshell-mode-hook
                dired-mode-hook
                magit-mode-hook
                help-mode-hook
                compilation-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(which-key-mode)
(setq which-key-idle-delay 0)

(use-package consult
  :ensure t
  :bind (
         ("C-x b" . consult-buffer)
         ("C-s" . consult-line)
         ("M-g e" . consult-flymake)
         ("M-g g" . consult-goto-line)))

(set-face-attribute 'default nil :font "Iosevka" :height 140)

(use-package ef-themes
  :ensure t
  :config
  (load-theme 'ef-duo-light t))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package dired
  :ensure nil
  :custom
  (dired-listing-switches "-agho --group-directories-first")
  (dired-dwim-target t))

(use-package diredfl
  :ensure t
  :hook (dired-mode . diredfl-mode))

;; -- nerd fonts a lot
;; (use-package nerd-icons-dired
;;   :ensure t
;;   :hook
;;   (dired-mode . nerd-icons-dired-mode))

(use-package olivetti
  :ensure t
  :custom
  (olivetti-body-width 110)
  (olivetti-recall-visual-line-mode-entry-state t))
