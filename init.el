(defun my-restore-gc ()
  "restore gc after startup."
  (setq gc-cons-threshold (* 16 1024 1024))) ; 16MiB
(add-hook 'emacs-startup-hook #'my-restore-gc)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defun load-local (file)
  (load (expand-file-name (concat "lisp/" file) user-emacs-directory)))

(make-directory (expand-file-name "savefile/" user-emacs-directory) t)
(setq backup-directory-alist `(("." . ,(expand-file-name "savefile/backups/" user-emacs-directory)))
      auto-save-file-name-transforms `((".*" ,(expand-file-name "savefile/autosaves/" user-emacs-directory) t))
      lock-file-name-transforms `((".*" ,(expand-file-name "savefile/locks/" user-emacs-directory) t)))

(load-local "ui.el")
(load-local "edit.el")
(load-local "keys.el")
(load-local "tools.el")
