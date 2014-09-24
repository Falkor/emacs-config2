;; -*- mode: lisp; -*-

(eval-after-load 'ruby-mode
  '(progn
	 (define-key ruby-mode-map (kbd "C-c t") 'ruby-jump-to-other)))
