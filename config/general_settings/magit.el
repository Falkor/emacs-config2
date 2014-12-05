;; -*- mode: emacs-lisp; -*-
;; Time-stamp: <Ven 2014-12-05 11:45 svarrette>
;; ----------------------------------------------------------------------
;; Magit management

(use-package magit
  :diminish (magit-auto-revert-mode)
  :bind     ("C-x g" . magit-status)
  :config
  (progn
    ;; (set-face-background 'magit-item-highlight "#121212")
    ;; (set-face-background 'diff-file-header "#121212")
    ;; (set-face-foreground 'diff-context "#666666")
    ;; (set-face-foreground 'diff-added "#00cc33")
    ;; (set-face-foreground 'diff-removed "#ff0000")
    ;;
    (setq magit-stage-all-confirm   nil)
    (setq magit-unstage-all-confirm nil)
    ;;
    (setq magit-restore-window-configuration t)
    ;; commit management
    (setq magit-commit-signoff                 t)
    (setq magit-commit-ask-to-stage            nil) ; do not ask to stage all
    (setq magit-commit-all-when-nothing-staged t)

    ;; step forward (`n`) and backward (`p`) through the git history of a file
    (use-package git-timemachine)

    ;; Handle Git flow
    (use-package magit-gitflow
      :config
      (progn
        (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)))

    ;; Port of GitGutter which is a plugin of Sublime Text
    ;; See https://github.com/nonsequitur/git-gutter-plus
    ;;(when (window-system)
	;; (use-package git-gutter+
	;;   :config
	;;   (progn
	;; 	(use-package git-gutter-fringe+)
	;; 	(require 'git-gutter-fringe+)
	;; 	(setq git-gutter-fr+-side 'right-fringe)
	;; 	(git-gutter-fr+-minimal)
	;; 	))
   ))


(use-package git-gutter-fringe
  :init (global-git-gutter-mode t)
  :config
  (progn
    (use-package fringe-helper)
    (setq git-gutter:hide-gutter t)
						  "......."
						  "......."
						  "XXXXX.."
						  "......."
						  "......."
						  )
    (fringe-helper-define 'git-gutter-fr:modified nil
						  "..X...."
						  ".XXX..."
						  "XXXXX.."
						  ".XXX..."
						  "..X...."
						  )
	(set-face-foreground 'git-gutter-fr:modified "grey50")
	(set-face-foreground 'git-gutter-fr:added    "grey50")
	(set-face-foreground 'git-gutter-fr:deleted  "grey50")
	)
