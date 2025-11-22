(setq package-enable-at-startup nil)
(setq custom-file "~/.emacs.d/custom.el")

(setq gc-cons-threshold most-positive-fixnum)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; gui slop
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10) ;; keep paddings


(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message "user"
      initial-scratch-message nil)

(setq native-comp-async-report-warnings-errors nil)
