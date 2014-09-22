;; -*- mode: lisp; -*-

;; LaTeX-sensitive spell checking
(setq ispell-enable-tex-parser t)

;; defautl dictionnary
(setq ispell-local-dictionary "en")

;; save the personal dictionary without confirmation
(setq ispell-silently-savep t)

;; enable the likeness criteria
;;(setq flyspell-sort-corrections nil)

;; dash character (`-') is considered as a word delimiter
;;(setq flyspell-consider-dash-as-word-delimiter-flag t)

;; Add flyspell to the following major modes
(dolist (hook '(text-mode-hook html-mode-hook messsage-mode-hook))
  (add-hook hook (lambda ()
                   (turn-on-auto-fill)
                   (flyspell-mode t))))

;; disable flyspell in change log and log-edit mode that derives from text-mode
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode nil))))

;; flyspell comments and strings in programming modes
;; (preventing it from finding mistakes in the code)
(dolist (hook '(autoconf-mode-hook autotest-mode-hook c++-mode-hook c-mode-hook cperl-mode-hook  emacs-lisp-mode-hook makefile-mode-hook nxml-mode-hook python-mode-hook
                                   sh-mode-hook))
  (add-hook hook 'flyspell-prog-mode))
