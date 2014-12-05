;; -*- mode: emacs-lisp; -*-
;; ----------------------------------------------------------------------
;; File: autocomplete.el -  See http://www.emacswiki.org/emacs/AutoComplete
;; Time-stamp: <Jeu 2014-12-04 11:16 svarrette>
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

(use-package pabbrev)

(use-package company
  :diminish " Comp"
  ;;:commands global-company-mode
  :bind (("<C-tab>"    . company-complete)
		 ("C-<return>" . company-complete))
  :config
  (progn
    (setq company-tooltip-limit 10
          company-idle-delay    0.5
          company-echo-delay    0
          ;; min prefix of 2 chars
          company-minimum-prefix-length 2
          company-selection-wrap-around t
          company-show-numbers t
          company-dabbrev-downcase nil
          company-transformers '(company-sort-by-occurrence))
    (bind-keys :map company-active-map
               ("C-n" . company-select-next)
               ("C-p" . company-select-previous)
               ("C-d" . company-show-doc-buffer)
               ("C-=" . helm-company)
               ("<tab>" . company-complete)
               ("TAB" . company-complete)
               )
    ;;(add-hook 'after-init-hook 'global-company-mode)
    ))

;; Default company mode colors are kind of ugly, I took these from auto-complete-mode defaults:
(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))

;; Defaults company backends for text-mode
(add-hook 'text-mode-hook
          '(lambda ()
             (setq company-backends '(company-capf      ; completion-at-point-functions
                                      company-yasnippet ; Yasnippets
                                      company-dabbrev   ; dabbrev-like
                                      company-files     ; file paths
                                      ))
             (company-mode)))


;; Defaults company backends for text-mode
(add-hook 'prog-mode-hook
          '(lambda ()
             (setq company-backends '(company-semantic  ; CEDET / Semantic
									  company-clang     ; C language family frontend for LLVM
									  company-dabbrev-code
									  company-gtags
									  company-etags
									  company-capf      ; completion-at-point-functions
                                      company-yasnippet ; Yasnippets
									  company-keywords  ; Programming language keywords
                                      company-dabbrev   ; dabbrev-like
                                      company-files     ; file paths
                                      ))
             (company-mode)))






;; (use-package company-c-headers
;;   :config
;;   (progn
;;     (defun falkor/company-c-headers ()
;;    (add-to-list 'company-backends 'company-c-headers))

;;  (add-hook 'c-mode-hook   'falkor/company-c-headers)
;;  (add-hook 'c++-mode-hook 'falkor/company-c-headers)))



;; ;;     (setq company-backends (delete 'company-semantic company-backends))
;; ;;     (define-key c-mode-map  [(tab)]   'company-complete)
;; ;;     (define-key c++-mode-map  [(tab)] 'company-complete)

;; ;;     (add-hook 'c-mode-hook   'falkor/company-c-headers)
;; ;;     (add-hook 'c++-mode-hook 'falkor/company-c-headers)))

;; ;; (add-hook 'after-init-hook 'global-company-mode)
;; ;; )

;; ;; (eval-after-load 'company
;; ;;   '(progn

;; ;;      (add-to-list 'company-backends 'company-c-headers)
;; ;;      (define-key company-mode-map (kbd "C-=")   'helm-company)
;; ;;      (define-key company-active-map (kbd "C-=") 'helm-company))

;; ;;   )


;; ;; (use-package auto-complete-config
;; ;;   ;;   :diminish auto-complete-mode
;; ;;   :init
;; ;;   (progn
;; ;;     (setq ac-comphist-file (get-conf-path ".ac-comphist.dat"))
;; ;;     (setq ac-auto-start     t)
;; ;;     ;; show menu immediately...
;; ;;     (setq ac-auto-show-menu t)
;; ;;     (add-to-list 'ac-dictionary-directories "~/.emacs.d/.ac-dict")
;; ;;     ;; (define-key ac-mode-map (kbd "M-/") 'ac-fuzzy-complete)
;; ;;     ;; (dolist (ac-mode '(text-mode org-mode latex-mode))
;; ;;     ;;   (add-to-list 'ac-modes ac-mode))
;; ;;     ;; (dolist (ac-mode-hook '(text-mode-hook org-mode-hook prog-mode-hook))
;; ;;     ;;   (add-hook ac-mode-hook
;; ;;     ;;             (lambda ()
;; ;;     ;;               (setq ac-fuzzy-enable t)
;; ;;     ;;               (add-to-list 'ac-sources 'ac-source-files-in-current-dir)
;; ;;     ;;               (add-to-list 'ac-sources 'ac-source-filename))))


;; ;;     ;; resetting ac-sources
;; ;;     (setq-default ac-sources '(
;; ;;                                ac-source-abbrev
;; ;;                                ac-source-dictionary
;; ;;                                ac-source-words-in-same-mode-buffers
;; ;;                                ))
;; ;;     )
;; ;;   :config
;; ;;   (progn
;; ;;     ;; set the trigger key so that it can work together with yasnippet on tab key,
;; ;;     ;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;; ;;     ;; activate, otherwise, auto-complete will
;; ;;     (ac-set-trigger-key "TAB")
;; ;;     (ac-set-trigger-key "<tab>")

;; ;;     (add-hook 'emacs-lisp-mode-hook    'ac-emacs-lisp-mode-setup)
;; ;;     (add-hook 'c-mode-common-hook      'ac-cc-mode-setup)
;; ;;     (add-hook 'ruby-mode-hook          'ac-ruby-mode-setup)
;; ;;     (add-hook 'css-mode-hook           'ac-css-mode-setup)
;; ;;     (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;; ;;     (bind-keys :map ac-completing-map
;; ;;                ("ESC" . ac-stop))



;; ;;     ;;(bind-keys :map ac-mode-map
;; ;;     ;;         ("<tab>" . ac-fuzzy-complete)
;; ;;     ;;         ("TAB"   . ac-fuzzy-complete)
;; ;;     ;;         )
;; ;;     ;;(ac-set-trigger-key "<backtab>")
;; ;;     ))

;; ;; (add-hook 'after-init-hook
;; ;;           (lambda ()
;; ;;             (ac-config-default)))

;; (provide 'falkor/core/auto-complete)
