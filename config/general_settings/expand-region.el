;; -*- mode: lisp; -*-
;; Time-stamp: <Mer 2014-09-24 23:12 svarrette>
;; ===============================================
;; Expand region increases the selected region by semantic units.

(use-package expand-region
  :bind (("C-@" . er/expand-region)
		 ("C-=" . er/contract-region)))
