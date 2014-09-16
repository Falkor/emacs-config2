;; === Indenting configuration ===
;; see http://www.emacswiki.org/emacs/IndentationBasics
(setq-default tab-width 2)
(defvaralias 'c-basic-offset 	 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; === Show whitespaces/tabs etc. ===
(setq x-stretch-cursor t)
(require 'show-wspace)
;

(setq-default indent-tabs-mode nil)     ; indentation can't insert tabs
;;(setq-default indent-tabs-mode t)
(require 'smarttabs)

(setq c-brace-offset -2)
;;(setq c-auto-newline t)
(add-hook 'c-mode-common-hook (lambda () (setq c-basic-offset 4)))
(add-hook 'c-mode-common-hook (lambda () (setq c-recognize-knr-p nil)))
(add-hook 'ada-mode-hook (lambda ()      (setq ada-indent 4)))
(add-hook 'perl-mode-hook (lambda ()     (setq perl-basic-offset 4)))
(add-hook 'cperl-mode-hook (lambda ()    (setq cperl-indent-level 4)))
