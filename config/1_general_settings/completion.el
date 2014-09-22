;; === Code completion ===
;; see http://www.emacswiki.org/emacs/TabCompletion


;;(require 'smart-tab)
(use-package smart-tab
  :init
  (progn
	(global-smart-tab-mode t)))


;; Disable indent "smart" alignement to insert real tabs
(defun indent-with-real-tab-hook ()
  (setq indent-line-function 'insert-tab)
  )
;;(add-hook 'text-mode-hook   'indent-with-real-tab-hook)
(add-hook 'conf-mode-hook   'indent-with-real-tab-hook)
