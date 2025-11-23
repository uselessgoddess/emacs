(use-package meow
  :ensure t
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
     ;; SPC j/k 
     '("j" . "H-j")
     '("k" . "H-k")
     '("s" . save-buffer)
     '("b" . consult-buffer)
     '("r" . consult-ripgrep)
     '("f" . find-file)
     '("d" . dired-jump)
     '("p" . project-switch-project)
     '("y" . meow-yank)

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
     '("j" . meow-join)   
     
     '("l" . meow-line)        
     '("x" . meow-line)        
     '("v" . meow-visit)         
     '("o" . meow-block)      
     '("z" . meow-pop-selection) 
     
     '("u" . meow-undo)         
     '("U" . meow-undo-in-selection) 
     '("g" . meow-cancel-selection) 
     '("<escape>" . ignore)))

  (meow-setup)
  (meow-global-mode 1))
