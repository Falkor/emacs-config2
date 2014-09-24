;; -*- mode: lisp; -*-


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

