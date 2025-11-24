(defvar my-goto-map (make-sparse-keymap)
  "Keymap for 'g' (Go to) commands.")

(define-key my-goto-map (kbd "d") #'xref-find-definitions)
(define-key my-goto-map (kbd "D") #'xref-find-definitions-other-window)
(define-key my-goto-map (kbd "r") #'xref-find-references)
(define-key my-goto-map (kbd "i") #'eglot-find-implementation)
(define-key my-goto-map (kbd "t") #'eglot-find-typeDefinition)
(define-key my-goto-map (kbd "a") #'xref-go-back)

;; flymake/eglot
(define-key my-goto-map (kbd "n") #'flymake-goto-next-error)
(define-key my-goto-map (kbd "p") #'flymake-goto-prev-error)

(define-key my-goto-map (kbd "g") #'beginning-of-buffer)
(define-key my-goto-map (kbd "e") #'end-of-buffer)

(fset 'my-goto-command my-goto-map)

(defvar my-project-map (make-sparse-keymap)
  "Keymap for Project commands.")

(define-key my-project-map (kbd "p") #'project-switch-project)
(define-key my-project-map (kbd "c") #'project-compile)
(define-key my-project-map (kbd "r") #'recompile)
(define-key my-project-map (kbd "k") #'kill-compilation)
(define-key my-project-map (kbd "f") #'project-find-file)
(define-key my-project-map (kbd "s") #'consult-ripgrep)
(define-key my-project-map (kbd "b") #'consult-project-buffer)

(fset 'my-project-command my-project-map)

(use-package meow
  :ensure t
  :init
  :custom
  (meow-expand-hint-remove-delay 5.0)
  :config

  (defun meow-setup ()
    (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)

    (meow-motion-overwrite-define-key
     '("j" . meow-next)
     '("k" . meow-prev)
     '("<escape>" . ignore))

    (meow-leader-define-key
     '("s" . save-buffer)
     '("b" . consult-buffer)
     '("r" . consult-ripgrep)
     '("f" . find-file)
     '("d" . dired-jump)
     '("y" . meow-yank)

     '("g" . magit-status)
     '("k" . my-show-documentation)
     '("p" . my-project-command)
     '("." . xref-find-definitions)

     '("1" . meow-digit-argument)
     '("2" . meow-digit-argument)
     '("3" . meow-digit-argument)
     '("4" . meow-digit-argument)
     '("5" . meow-digit-argument)
     '("6" . meow-digit-argument)
     '("7" . meow-digit-argument)
     '("8" . meow-digit-argument)
     '("9" . meow-digit-argument)
     '("0" . meow-digit-argument)
     '("/" . meow-keypad-describe-key)
     '("?" . meow-cheatsheet))

    (meow-normal-define-key
     '("0" . meow-expand-0)
     '("9" . meow-expand-9)
     '("8" . meow-expand-8)
     '("7" . meow-expand-7)
     '("6" . meow-expand-6)
     '("5" . meow-expand-5)
     '("4" . meow-expand-4)
     '("3" . meow-expand-3)
     '("2" . meow-expand-2)
     '("1" . meow-expand-1)
     '("-" . negative-argument)
     '(";" . meow-reverse)

     '("g" . my-goto-command)

     '("D" . my-duplicate-line)
     '("/" . consult-line)

     '("n" . meow-next)
     '("N" . meow-prev)
     '("j" . meow-back-word)
     '("b" . meow-back-word)
     '("w" . meow-next-word)
     '("f" . meow-next-word)

     '("i" . meow-insert)
     '("a" . meow-append)
     '("c" . meow-change)
     '("s" . meow-kill)
     '("d" . meow-delete)
     '("y" . meow-save)

     '("l" . meow-line)
     '("x" . meow-line)
     '("v" . meow-visit)
     '("o" . meow-block)
     '("z" . meow-pop-selection)

     '("u" . meow-undo)
     '("q" . my-smart-quit)
     '("Q" . quit-window)
     '("<escape>" . ignore)))

  (meow-setup)
  (meow-global-mode 1))
