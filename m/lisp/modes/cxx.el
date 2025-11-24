(use-package c++-ts-mode
  :ensure nil
  :mode ("\\.cpp\\'" "\\.hpp\\'" "\\.cc\\'" "\\.hh\\'" "\\.hxx\\" "\\.cxx\\")
  :hook
  (c++-ts-mode . rainbow-delimiters-mode))

(use-package c-ts-mode
  :ensure nil
  :mode ("\\.c\\'" "\\.h\\'")
  :hook
  (c-ts-mode . rainbow-delimiters-mode))

(use-package eglot
  :ensure nil
  :hook
  ((c-ts-mode c++-ts-mode) . my-cpp-eglot-config)
  ((c-ts-mode c++-ts-mode) . eglot-ensure)
  ((c-ts-mode c++-ts-mode) . eglot-inlay-hints-mode)
)
