;; -*- mode: emacs-lisp; -*-

;; See http://crypt.codemancers.com/posts/2013-09-26-setting-up-emacs-as-development-environment-on-osx/

;; https://github.com/magnars/.emacs.d/blob/master/setup-ruby-mode.el

(defun ruby--jump-to-test ()
  (find-file
   (replace-regexp-in-string
    "/lib/" "/test/"
    (replace-regexp-in-string
     "/\\([^/]+\\).rb$" "/test_\\1.rb"
     (buffer-file-name)))))

(defun ruby--jump-to-lib ()
  (find-file
   (replace-regexp-in-string
    "/test/" "/lib/"
    (replace-regexp-in-string
     "/test_\\([^/]+\\).rb$" "/\\1.rb"
     (buffer-file-name)))))

(defun ruby-jump-to-other ()
  (interactive)
  (if (string-match-p "/test/" (buffer-file-name))
      (ruby--jump-to-lib)
    (ruby--jump-to-test)))


(use-package enh-ruby-mode
  :mode (("\\.rake$"    . enh-ruby-mode)
         ("\\.gemspec$" . enh-ruby-mode)
         ("\\.ru$"      . enh-ruby-mode)
         ("Rakefile$"   . enh-ruby-mode)
         ("Gemfile$"    . enh-ruby-mode)
         ("Capfile$"    . enh-ruby-mode)
         ("Puppetfile$" . enh-ruby-mode)
         ("Guardfile$"  . enh-ruby-mode)
		 ("Vagrantfile" . enh-ruby-mode))
  :init
  (progn
    (add-hook 'enh-ruby-mode-hook 'robe-mode)
    ;;(add-hook 'robe-mode-hook 'ac-robe-setup)
	))

(use-package robe
  :ensure robe
  :init (progn
		  (add-hook 'ruby-mode-hook 'robe-mode)
		  (push 'company-robe company-backends)))

(use-package rvm
      :init (rvm-use-default)
      :config (setq rvm-verbose nil))

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))
