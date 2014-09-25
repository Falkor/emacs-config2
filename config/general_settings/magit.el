;; -*- mode: lisp; -*-
;; Time-stamp: <Ven 2014-09-26 00:13 svarrette>
;; ----------------------------------------------------------------------
;; Magit management

(use-package magit
  :config
  (progn
	(set-face-background 'magit-item-highlight "#121212")
	(set-face-background 'diff-file-header "#121212")
	(set-face-foreground 'diff-context "#666666")
	(set-face-foreground 'diff-added "#00cc33")
	(set-face-foreground 'diff-removed "#ff0000")
	;;
	(setq magit-stage-all-confirm   nil)
	(setq magit-unstage-all-confirm nil)
	;;
	(setq magit-restore-window-configuration t)
	;; commit management
	(setq magit-commit-signoff                 t)
	(setq magit-commit-ask-to-stage            nil) ; do not ask to stage all
	;;(setq magit-commit-all-when-nothing-staged t)
	)
  :bind ("C-x g" . magit-status))


