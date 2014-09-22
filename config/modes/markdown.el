;; -*- mode: lisp; -*-
;; === Markdown ===
;; see http://jblevins.org/projects/markdown-mode/
;;(require 'markdown-mode)

(defun markdown-preview-file ()
      "run Marked on the current file and revert the buffer"
      (interactive)
      (shell-command
       (format "open -a /Applications/Marked\ 2.app %s"
               (shell-quote-argument (buffer-file-name)))))

(use-package markdown-mode
  :mode (("\\.md\\'"    . markdown-mode)
		 ("\\.mdown\\'" . markdown-mode))
  :init
  (progn
	(setq markdown-command "pandoc --smart -f markdown -t html")
	(setq markdown-css-path (expand-file-name "markdown.css" emacs-root)))
  :bind ("C-x M" . markdown-preview-file))


;; (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))

;; (add-hook 'markdown-mode-hook
;;           (lambda ()
;;             (visual-line-mode t)
;;             (writegood-mode t)
;;             (flyspell-mode t)))

;; 
;; 
