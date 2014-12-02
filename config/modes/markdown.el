;; -*- mode: elisp; -*-
;; === Markdown ===
;; see http://jblevins.org/projects/markdown-mode/
;;(require 'markdown-mode)

(defun markdown-preview-file ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "open -a /Applications/Marked.app %s"
           (shell-quote-argument (buffer-file-name)))))

(defun markdown-unset-tab ()
  "markdown-mode-hook"
  (define-key markdown-mode-map (kbd "<tab>")     nil)
  (define-key markdown-mode-map (kbd "TAB")       nil)
  (define-key markdown-mode-map (kbd "<backtab>") nil))

(use-package markdown-mode
  :mode (("\\.txt\\'"   . markdown-mode)
         ("\\.md\\'"    . markdown-mode)
         ("\\.mdown\\'" . markdown-mode))
  :init
  (progn
    (setq markdown-command "pandoc --smart -f markdown -t pdf")
    (setq markdown-css-path (expand-file-name "markdown.css" emacs-root)))
  :bind (("C-c C-v" . markdown-preview-file)
         ;;("C-c C-e" . )
         )
  :config
  (progn
    (use-package gfm-mode
      :mode ("README\\.md\\'" . gfm-mode))

    (use-package pandoc-mode
	  :bind ("C-c C-e" . pandoc-convert-to-pdf)
	  :config
	  (progn
		(add-hook 'markdown-mode-hook 'pandoc-mode)))

	(require 'org-table)
	(add-hook 'markdown-mode-hook 'orgtbl-mode)
	
	;; alter markdown-mode way of handling tabs
	(defun cleanup-org-tables-for-markdown ()
	  (save-excursion
		(goto-char (point-min))
		(while (search-forward "-+-" nil t) (replace-match "-|-"))
		))
	(add-hook 'markdown-mode-hook
          (lambda()
            (add-hook 'after-save-hook 'cleanup-org-tables  nil 'make-it-local)))

	;; Finalize  configuration for markdown
    (add-hook 'markdown-mode-hook
              (lambda ()
                (visual-line-mode t)
                (whitespace-mode  -1)
                (flyspell-mode    t)))

	(bind-key "<tab>" 'yas-expand markdown-mode-map)
    ))
