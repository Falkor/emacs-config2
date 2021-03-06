;; -*- mode: emacs-lisp; -*-

;;
;; Helper functions
;;

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

;; === Indentation of the full buffer ===
;; Courtesy from http://emacsblog.org/2007/01/17/indent-whole-buffer/
(defun indent-buffer ()
  "indent whole buffer"
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))))

;; === Yank (copy) and indent the copied region
;; see http://www.emacswiki.org/emacs/AutoIndentation
(defun yank-and-indent ()
  "Yank and then indent the newly formed region according to mode."
  (interactive)
  (yank)
  (call-interactively 'indent-region))

;; ;; === unindent ===
;; (defun unindent-region ()
;;   (interactive)
;;   (save-excursion
;; 	(if (< (point) (mark)) (exchange-point-and-mark))
;; 	(let ((save-mark (mark)))
;; 	  (if (= (point) (line-beginning-position)) (previous-line 1))
;; 	  (goto-char (line-beginning-position))
;; 	  (while (>= (point) save-mark)
;; 		(goto-char (line-beginning-position))
;; 		(if (= (string-to-char "\t") (char-after (point))) (delete-char 1))
;; 		(previous-line 1)))))


;; ==================== Let's go ====================

;; === Indenting configuration ===
;; see http://www.emacswiki.org/emacs/IndentationBasics

;; === Get ride of tabs most of the time ===
(setq-default indent-tabs-mode nil)     ; indentation can't insert tabs
(setq-default tab-width 4)
(setq-default tab-always-indent 'complete)

(setq c-basic-offset 4)
(defvaralias 'c-basic-offset 	      'tab-width)
(defvaralias 'cperl-indent-level    'tab-width)
(defvaralias 'ruby-indent-level     'tab-width)
(defvaralias 'enh-ruby-indent-level 'tab-width)

;; === Show whitespaces/tabs etc. ===
(setq x-stretch-cursor t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;(setq-default c-basic-offset 4
;;              tab-width 4
;;              indent-tabs-mode t)

;; === enable automatic indentation ===
(electric-indent-mode 1)


;; (setq c-brace-offset -2)
;;(setq c-auto-newline t)

;; (add-hook 'c-mode-common-hook (lambda () (setq c-basic-offset 4)))
;; (add-hook 'c-mode-common-hook (lambda () (setq c-recognize-knr-p nil)))
;; (add-hook 'ada-mode-hook (lambda ()      (setq ada-indent 4)))
;; (add-hook 'perl-mode-hook (lambda ()     (setq perl-basic-offset 4)))
;; (add-hook 'cperl-mode-hook (lambda ()    (setq cperl-indent-level 4)))
;; (add-hook 'ruby-mode-hook (lambda () (setq ruby-indent-level 4)))
