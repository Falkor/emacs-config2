;; Settings for org-mode
;; See http://www.aaronbedra.com/emacs.d/#org-mode

;; === Settings ===
;; Enable logging when tasks are complete. This puts a time-stamp on the
;; completed task. Since I usually am doing quite a few things at once, I added
;; the INPROGRESS keyword and made the color blue. Finally, enable flyspell-mode
;; and writegood-mode when org-mode is active.

(setq org-log-done t
      org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE"))
      org-todo-keyword-faces '(("INPROGRESS" . (:foreground "blue" :weight bold))))
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))
(add-hook 'org-mode-hook
          (lambda ()
            (writegood-mode)))

;; === org-agenda ===

(setq org-rootdir "~/Dropbox/SyncFolder/org/")

(setq org-agenda-show-log t
      org-agenda-todo-ignore-scheduled t
      org-agenda-todo-ignore-deadlines t)
(setq org-agenda-files (concat org-rootdir "personal.org"))
;; (setq org-agenda-files (list "~/Dropbox/org/personal.org"
;;                              "~/Dropbox/org/groupon.org"))

;; === org-habbit ===
(require 'org)
(require 'org-install)
(require 'org-habit)
(add-to-list 'org-modules "org-habit")
(setq org-habit-preceding-days 7
      org-habit-following-days 1
      org-habit-graph-column 80
      org-habit-show-habits-only-for-today t
      org-habit-show-all-today t)


;; === org-babel ===
;; org-babel is a feature inside of org-mode that makes this document possible.
;; It allows for embedding languages inside of an org-mode document with all the
;; proper font-locking. It also allows you to extract and execute code. It isn't
;; aware of Clojure by default, so the following sets that up.
(require 'ob)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)
   (dot . t)
   (ruby . t)))

(add-to-list 'org-src-lang-modes (quote ("dot". graphviz-dot)))

(defvar org-babel-default-header-args:clojure
  '((:results . "silent") (:tangle . "yes")))

(defun org-babel-execute:clojure (body params)
  (lisp-eval-string body)
  "Done!")

(provide 'ob-clojure)

(setq org-src-fontify-natively t
      org-confirm-babel-evaluate nil)

(add-hook 'org-babel-after-execute-hook (lambda ()
                                          (condition-case nil
                                              (org-display-inline-images)
                                            (error nil)))
          'append)


;; ==== org-abbrev ===

(add-hook 'org-mode-hook (lambda () (abbrev-mode 1)))

(define-skeleton skel-org-block-elisp
  "Insert an emacs-lisp block"
  ""
  "#+begin_src emacs-lisp\n"
  _ - \n
  "#+end_src\n")

(define-abbrev org-mode-abbrev-table "selisp" "" 'skel-org-block-elisp)

(define-skeleton skel-header-block
  "Creates my default header"
  ""
  "#+TITLE: " str "\n"
  "#+AUTHOR: Aaron Bedra\n"
  "#+EMAIL: aaron@aaronbedra.com\n"
  "#+OPTIONS: toc:3 num:nil\n"
  "#+STYLE: <link rel=\"stylesheet\" type=\"text/css\" href=\"http://thomasf.github.io/solarized-css/solarized-light.min.css\" />\n")

(define-abbrev org-mode-abbrev-table "sheader" "" 'skel-header-block)
