;; -*- mode: lisp; -*-
;; Time-stamp: <Sam 2014-10-04 11:26 svarrette>
;; ----------------------------------------------------------------------
;; Solidity mode setting - cf https://github.com/ethereum/emacs-solidity

;; brew install solidity
(use-package solidity-mode
  :mode (("\\.sol\\'"   . solidity-mode))
  :init
  (progn
    ;; default: 'star
    (setq solidity-comment-style 'slash)))

(use-package solidity-flycheck
  :init
  (progn
    ;; activate solc checker
    (setq solidity-flycheck-solc-checker-active t))) 