;; -*- mode: lisp; -*-

;; === Yasnippet ===
;; Templates using Yasnippet: Yet Another Snippet extension for Emacs.
;; see http://www.emacswiki.org/emacs/Yasnippet and http://yasnippet.googlecode.com
;; Installation notes: see README

;; Classical setup
(require 'yasnippet)
;;(yas-global-mode 1)

;; Hotfix for conflicts between yasnippet and smart-tab
;; see https://github.com/haxney/smart-tab/issues/1
;; (add-to-list 'hippie-expand-try-functions-list 
;; 			 'yas/hippie-try-expand) ;put yasnippet in hippie-expansion list
;; actually moved to 1_general_settings/completion.el

(hook-into-modes #'(lambda () (yas-minor-mode 1))
                   '(prog-mode-hook
                     org-mode-hook
                     ruby-mode-hook
                     message-mode-hook
                     gud-mode-hook
                     erc-mode-hook))

;; (bind-keys :map yas-minor-mode-map
;;   ("C-<return>" . yas-expand)
;;   ("M-<return>" . yas-expand))

;;(global-set-key (kbd "C-<return>") #'yas-expand yas-minor-mode-map)

;;  'yas-expand )


;; No need to be so verbose
;; (setq yas-verbosity 1)

;; ;; Wrap around region
;; (setq yas-wrap-around-region t)

(define-key yas-minor-mode-map (kbd "C-<return>") 'yas-expand)
(define-key yas-minor-mode-map (kbd "M-<return>") 'yas-expand)


;;(yas-global-mode 1)

;; (bind-key "C-<return>" #'yas-expand yas-minor-mode-map)
;; (bind-key "M-<return>" #'yas-expand yas-minor-mode-map)

;; (use-package yasnippet
;;   :if (not noninteractive)
;;   :diminish yas-minor-mode
;;   :commands (yas-minor-mode yas-expand)
;;   :mode ("/\\.emacs\\.d/snippets/" . snippet-mode)
;;   :init
;;   (hook-into-modes #'(lambda () (yas-minor-mode 1))
;;                    '(prog-mode-hook
;;                      org-mode-hook
;;                      ruby-mode-hook
;;                      message-mode-hook
;;                      gud-mode-hook
;;                      erc-mode-hook))
;;   :config
;;   (progn
;; 	(setq yas-verbosity 0)
;;     (yas-load-directory (expand-file-name "snippets/" emacs-root))

;;     (bind-key "C-i" 'yas-next-field-or-maybe-expand yas-keymap)

;;     (defun yas-new-snippet (&optional choose-instead-of-guess)
;;       (interactive "P")
;;       (let ((guessed-directories (yas-guess-snippet-directories)))
;;         (switch-to-buffer "*new snippet*")
;;         (erase-buffer)
;;         (kill-all-local-variables)
;;         (snippet-mode)
;;         (set (make-local-variable 'yas-guessed-modes)
;;              (mapcar #'(lambda (d)
;;                          (intern (yas-table-name (car d))))
;;                      guessed-directories))
;;         (unless (and choose-instead-of-guess
;;                      (not (y-or-n-p "Insert a snippet with useful headers? ")))
;;           (yas-expand-snippet "\
;;   # -*- mode: snippet -*-
;;   # name: $1
;;   # --
;;   $0"))))

;; (bind-key "C-<return>" 'yas-expand)
;; (bind-key "M-<return>" 'yas-expand)
;;     (bind-key "C-c y n" 'yas-new-snippet)
;;     (bind-key "C-c y f" 'yas-find-snippets)
;;     (bind-key "C-c y r" 'yas-reload-all)
;;     (bind-key "C-c y v" 'yas-visit-snippet-file)))


;; (bind-keys*
;;  ("C-<return>" . yas-expand)
;;  ("M-<return>" . yas-expand))

;; Advanced setup with [use-package](https://github.com/jwiegley/use-package)
;; (use-package yasnippet
;;   :commands (yas-global-mode yas-minor-mode yas-expand)
;;   :mode ("/\\.emacs\\.d/snippets/" . snippet-mode)
;;   :init (yas-global-mode 1)
;;   :config
;;   (progn
;; 	(setq yas-verbosity 0)
;; 	;; (setq yas-snippet-dirs (concat emacs-root "snippets"))
;; 	;; (yas-load-directory yas-snippet-dirs)
;; 	(bind-keys :map yas-minor-mode-map
;; 			   ("C-<return>" . yas-expand)
;; 			   ("M-<return>" . yas-expand))
;; 	))
;;   ;; :bind (("C-<return>" . yas-expand)
;;   ;; 		 ("M-<return>" . yas-expand)))




;;(yas/initialize)

