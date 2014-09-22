;; ==============================================================
;; Autopair: Automagically pair braces and quotes like TextMate
;; see http://code.google.com/p/autopair/ or
;; http://www.emacswiki.org/emacs/AutoPairs
;; ==============================================================
;;(require 'autopair)

(use-package autopair
  :commands (autopair-global-mode)
  :config
  (progn
	(autopair-global-mode) ;; enable autopair in all buffers
	(setq autopair-autowrap t))
  :bind ("C-j" . autopair-newline))

