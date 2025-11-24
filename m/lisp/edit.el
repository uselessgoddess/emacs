(setq select-enable-clipboard t)
(setq select-enable-primary t)
(setq save-interprogram-paste-before-kill t)

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (global-treesit-auto-mode)
  (let ((langs '(json yaml bash toml)))
    (dolist (lang langs)
      (add-to-list 'treesit-auto-langs lang))))

(use-package eglot
  :bind ("C-c a" . eglot-code-actions))

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


(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init
  (setq markdown-fontify-code-blocks-natively t)
  :config
  (add-to-list 'markdown-code-lang-modes '("rust" . rust-ts-mode))
  (add-to-list 'markdown-code-lang-modes '("cpp" . c++-ts-mode)))

(use-package eldoc-box
  :ensure t
  :custom
  (eldoc-box-clear-with-C-g t)
  :config
  (setq eldoc-idle-delay 0.25)
  )

(defun my-duplicate-line ()
  (interactive)
  (let ((col (current-column))
	(content (buffer-substring-no-properties
		  (line-beginning-position)
		  (line-end-position))))
    (end-of-line)
    (newline)
    (insert content)
    (beginning-of-line)
    (move-to-column col)))

(defun my-show-documentation ()
  "Describe symbol popup"
  (interactive)
  (cond
   ;; emacs lisp
   ((derived-mode-p 'emacs-lisp-mode)
    (let ((sym (symbol-at-point)))
      (if sym
          (describe-symbol sym)
        (message "no symbol"))))
   ;; lsp
   ((bound-and-true-p eglot--managed-mode)
       (if (featurep 'eldoc-box)
           (eldoc-box-help-at-point)
         (eldoc-doc-buffer))) ;; todo! fix this fallback
   ;; fallback
   (t (describe-symbol (symbol-at-point)))))


(defun my-smart-quit ()
  "Close helper windows."
  (interactive)
  (let ((found-window nil)
        (current-window (selected-window)))

    (walk-windows
     (lambda (w)
       (unless (eq w current-window)
         (with-current-buffer (window-buffer w)
           (when (or (eq major-mode 'help-mode)
                     (eq major-mode 'compilation-mode)
                     (string-match-p "^\\*eldoc" (buffer-name))
                     (string-match-p "^\\*Help" (buffer-name)))
             (setq found-window w)))))
     nil t)

    (if found-window
        (delete-window found-window))))
