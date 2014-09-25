;; -*- mode: lisp; -*-
;; Time-stamp: <Jeu 2014-09-25 23:39 svarrette>
;; ----------------------------------------------------------------------
;; Magit management

(set-face-background 'magit-item-highlight "#121212")
(set-face-background 'diff-file-header "#121212")
(set-face-foreground 'diff-context "#666666")
(set-face-foreground 'diff-added "#00cc33")
(set-face-foreground 'diff-removed "#ff0000")

(set-default 'magit-stage-all-confirm nil)
(set-default 'magit-unstage-all-confirm nil)

(setq magit-commit-signoff t)
