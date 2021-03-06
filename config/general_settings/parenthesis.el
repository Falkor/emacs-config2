;; === Show matching parenthesis ===
(require 'paren)
(GNUEmacs
 (show-paren-mode t)
 (setq show-paren-ring-bell-on-mismatch t))
(XEmacs
 (paren-set-mode 'paren))

(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "turquoise")
;; (set-face-attribute 'show-paren-match-face nil
;;                     :weight 'bold :underline nil :overline nil :slant 'normal)
(set-face-foreground 'show-paren-mismatch-face "red")
(set-face-attribute 'show-paren-mismatch-face nil
                    :weight 'bold :underline t :overline nil :slant 'normal)


;; show matching parenthesis, even if found outside the present screen.
;; see http://www.emacswiki.org/emacs/MicParen
;; (require 'mic-paren)                    ; loading
;; (paren-activate)                        ; activating
(use-package mic-paren
  :init
  (progn
    (paren-activate)))

;; (use-package smartparens
;;   :config
;;   (progn
;;     (require 'smartparens-config)
;;     (require 'smartparens-ruby)
;;     (smartparens-global-mode)
;;     (show-smartparens-global-mode t)
;;     (sp-with-modes '(rhtml-mode)
;;                    (sp-local-pair "<" ">")
;;                    (sp-local-pair "<%" "%>"))))
