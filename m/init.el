(defun my-restore-gc ()
  "restore gc after startup."
  (setq gc-cons-threshold (* 16 1024 1024))) ; 16MiB
(add-hook 'emacs-startup-hook #'my-restore-gc)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defun load-local (file)
  (load (expand-file-name (concat "lisp/" file) user-emacs-directory)))

(let ((backup-dir (expand-file-name "savefile/backups/" user-emacs-directory))
      (auto-save-dir (expand-file-name "savefile/autosaves/" user-emacs-directory))
      (lock-dir (expand-file-name "savefile/locks/" user-emacs-directory)))

  (dolist (dir (list backup-dir auto-save-dir lock-dir))
    (unless (file-exists-p dir)
      (make-directory dir t)))

  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-save-dir t))
        lock-file-name-transforms `((".*" ,lock-dir t))
        create-lockfiles nil))

(load-local "ui.el")
(load-local "edit.el")
(load-local "tools.el")
(load-local "meow.el")

;; todo: load modes automatically
(load-local "modes/rust.el")
