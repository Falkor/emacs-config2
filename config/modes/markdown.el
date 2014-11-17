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
  :mode (("\\.txt\\'"   . markdown-mode)
		 ("\\.md\\'"    . markdown-mode)
		 ("\\.mdown\\'" . markdown-mode))
  :init
  (progn
	(local-unset-key "<tab>") ;; disable markdown-cycle
	(setq markdown-command "pandoc --smart -f markdown -t html")
	(setq markdown-css-path (expand-file-name "markdown.css" emacs-root)))
  :bind ("C-c C-v" . markdown-preview-file)
  :config
  (progn
	(use-package gfm-mode
	  :mode ("README\\.md\\'" . gfm-mode))
	(add-hook 'markdown-mode-hook
			  (lambda ()
				(visual-line-mode t)
				(whitespace-mode  -1)
				(flyspell-mode    t)))))

