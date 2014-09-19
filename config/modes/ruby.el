;; -*- mode: lisp; -*-

(setq auto-mode-alist
      (append
       '(("\\.rake$"        . ruby-mode)
         ("\\.gemspec$"     . ruby-mode)
         ("\\.rb$"          . ruby-mode)
         ("Rakefile$"       . ruby-mode)
         ("Gemfile$"        . ruby-mode)
         ("Capfile$"        . ruby-mode)
         ("Vagrantfile"     . ruby-mode))
       auto-mode-alist))

