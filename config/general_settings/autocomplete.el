;; -*- mode: lisp; -*-
;; ----------------------------------------------------------------------
;; File: autocomplete.el -  See http://www.emacswiki.org/emacs/AutoComplete
;; Time-stamp: <Lun 2014-11-17 15:00 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; .
;; ----------------------------------------------------------------------

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

(use-package pabbrev
  :commands pabbrev-mode
  :diminish pabbrev-mode)



;; (use-package company
;;   :config
;;   (global-company-mode))

(use-package auto-complete-config
  :diminish auto-complete-mode
  :init
  (progn
    (setq ac-comphist-file (get-conf-path ".ac-comphist.dat"))
    (add-to-list 'ac-dictionary-directories "~/.emacs.d/.ac-dict")
    ;; (define-key ac-mode-map (kbd "M-/") 'ac-fuzzy-complete)
    ;; (dolist (ac-mode '(text-mode org-mode latex-mode))
    ;;   (add-to-list 'ac-modes ac-mode))
    ;; (dolist (ac-mode-hook '(text-mode-hook org-mode-hook prog-mode-hook))
    ;;   (add-hook ac-mode-hook
    ;;             (lambda ()
    ;;               (setq ac-fuzzy-enable t)
    ;;               (add-to-list 'ac-sources 'ac-source-files-in-current-dir)
    ;;               (add-to-list 'ac-sources 'ac-source-filename))))

    (ac-config-default)
                                        ; resetting ac-sources
    (setq-default ac-sources '(
                               ac-source-yasnippet
                               ac-source-abbrev
                               ac-source-dictionary
                               ac-source-words-in-same-mode-buffers
                               ))



    )
  :config
  (progn
    ;; set the trigger key so that it can work together with yasnippet on tab key,
    ;; if the word exists in yasnippet, pressing tab will cause yasnippet to
    ;; activate, otherwise, auto-complete will
    (ac-set-trigger-key "TAB")
    (ac-set-trigger-key "<tab>")

    ;;(bind-keys :map ac-mode-map
    ;;         ("<tab>" . ac-fuzzy-complete)
    ;;         ("TAB"   . ac-fuzzy-complete)
    ;;         )
    ;;(ac-set-trigger-key "<backtab>")
    ))
