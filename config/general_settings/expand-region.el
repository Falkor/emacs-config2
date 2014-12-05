;; -*- mode: lisp; -*-
;; Time-stamp: <Jeu 2014-11-27 22:29 svarrette>
;; ===============================================
;; Expand region increases the selected region by semantic units.

(use-package expand-region
  :bind (("C-@" . er/expand-region)
		 ("C-&" . er/contract-region)))
