;; -*- mode: lisp; -*-
;; === LaTeX ===


;; Automagic detection of master file
;; See http://www.emacswiki.org/AUCTeX#toc19
(defun guess-TeX-master (filename)
  "Guess the master file for FILENAME from currently open .tex files."
  (let ((candidate nil)
		(filename (file-name-nondirectory filename)))
	(save-excursion
	  (dolist (buffer (buffer-list))
		(with-current-buffer buffer
		  (let ((name (buffer-name))
				(file buffer-file-name))
			(if (and file (string-match "\\.tex$" file))
				(progn
				  (goto-char (point-min))
				  (if (re-search-forward (concat "\\\\begin{document}") nil t)
					  (setq candidate file))
				  (if (re-search-forward (concat "\\\\input{" filename "}") nil t)
					  (setq candidate file))
				  (if (re-search-forward (concat "\\\\include{" (file-name-sans-extension filename) "}") nil t)
					  (setq candidate file))))))))
	(if candidate
		(message "TeX master document: %s" (file-name-nondirectory candidate)))
	candidate))


(use-package tex-site
  :config
  (progn
    (setq TeX-auto-save t)
    (setq TeX-parse-self t)
    (setq-default TeX-master nil) ; Query for master file.
    ;;(setq TeX-master (guess-TeX-master (buffer-file-name)))
    (setq TeX-PDF-mode t)
	;;
    ;; use Skim as default pdf viewer
    ;; Skim's displayline is used for forward search (from .tex to .pdf)
    ;; option -b highlights the current line; option -g opens Skim in the background
    (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
    ;;(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "make")))
    (setq TeX-view-program-list
          '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))))

(use-package latex-mode
  :commands LaTeX-math-mode
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (progn
    (add-hook 'LaTeX-mode-hook
              (lambda ()
                (visual-line-mode t)
                (LaTeX-math-mode)
                ;;(setq TeX-master (guess-TeX-master (buffer-file-name)))
                ;; RefTex: manage cross references, bibliographies, indices, document navigation
                ;; and a few other things
                ;; see http://www.emacswiki.org/emacs/RefTeX
                (turn-on-reftex)))
	(setq LaTeX-command "pdflatex -synctex=1")

	;; make latexmk available via C-c C-c
	;; Note: SyncTeX is setup via ~/.latexmkrc as follows:
	;;
	;;  $pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';
	;;  $pdf_previewer = 'open -a skim';
	;;  $clean_ext = 'bbl rel %R-blx.bib %R.synctex.gz';
    ;;
	;; (add-hook 'LaTeX-mode-hook (lambda ()
    ;;                              (push
    ;;                               '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
    ;;                                 :help "Run latexmk on file")
    ;;                               TeX-command-list)))
	(setq reftex-plug-into-AUCTeX t)
    (setq LaTeX-item-indent 0)
    (setq TeX-brace-indent-level 2)))




;; ;; new setup
;; (use-package tex-site
;;   :load-path "site-lisp/auctex/preview/"
;;   :defines (latex-help-cmd-alist latex-help-file)
;;   :mode ("\\.tex\\'" . latex-mode)
;;   :config
;;   (progn
;;     (defun latex-help-get-cmd-alist ()  ;corrected version:
;;       "Scoop up the commands in the index of the latex info manual.
;;    The values are saved in `latex-help-cmd-alist' for speed."
;;       ;; mm, does it contain any cached entries
;;       (if (not (assoc "\\begin" latex-help-cmd-alist))
;;           (save-window-excursion
;;             (setq latex-help-cmd-alist nil)
;;             (Info-goto-node (concat latex-help-file "Command Index"))
;;             (goto-char (point-max))
;;             (while (re-search-backward "^\\* \\(.+\\): *\\(.+\\)\\." nil t)
;;               (let ((key (buffer-substring (match-beginning 1) (match-end 1)))
;;                     (value (buffer-substring (match-beginning 2)
;;                                              (match-end 2))))
;;                 (add-to-list 'latex-help-cmd-alist (cons key value))))))
;;       latex-help-cmd-alist)
;;    (setq TeX-parse-self t) ; enable parse on load (if no style hook is found for the file)
;;    (setq TeX-directory ".")
;;    (setq TeX-mode-hook '((lambda () (setq abbrev-mode t))))
;;    (setq-default TeX-PDF-mode t)
;;    ;; number of spaces to add to the indentation for each `{' not matched by a `}'
;;    (setq TeX-brace-indent-level 2)         ; 4
;;    (setq TeX-newline-function 'newline-and-indent)

;;     (use-package latex-mode
;;       :defer t
;;       :config
;;       (progn
;;        ;; number of spaces to add to the indentation for each `\begin' not matched by a
;;        ;; `\end'
;;        (setq LaTeX-indent-level 4)
;;        (setq LaTeX-item-indent  2)

;;         (use-package preview)
;;         (use-package ac-math)
;;         (use-package reftex
;;          :config
;;          (progn
;;            (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;;            (setq reftex-plug-into-AUCTeX t))
;;          )

;;         (defun ac-latex-mode-setup ()
;;           (nconc ac-sources
;;                  '(ac-source-math-unicode ac-source-math-latex
;;                                           ac-source-latex-commands)))
;;         (add-to-list 'ac-modes 'latex-mode)
;;         (add-hook 'latex-mode-hook 'ac-latex-mode-setup)

;;         (info-lookup-add-help :mode 'latex-mode
;;                               :regexp ".*"
;;                               :parse-rule "\\\\?[a-zA-Z]+\\|\\\\[^a-zA-Z]"
;;                               :doc-spec '(("(latex2e)Concept Index" )
;;                                           ("(latex2e)Command Index")))))))


;; OLD setup
;; ;; Load AucTeX : see http://www.gnu.org/software/auctex/
;; ;; Debian/ubuntu: apt-get install auctex
;; ;; Mac OS X: preinstalled on Carbon Emacs
;; ;;(load "auctex.el" nil t t)
;; (require 'tex-site)

;; ;; AUC TeX will will assume the file is a master file itself
;; ;;(setq-default TeX-master t)

;; ;;(setq TeX-auto-save t)

;; (setq TeX-parse-self t) ; enable parse on load (if no style hook is found for the file)

;; (setq TeX-directory ".")
;; (setq TeX-mode-hook '((lambda () (setq abbrev-mode t))))

;; (setq-default TeX-PDF-mode t)         ; use PDF mode by default (instead of DVI)

;; ;;(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;; ;; number of spaces to add to the indentation for each `\begin' not matched by a
;; ;; `\end'
;; (setq LaTeX-indent-level 4)

;; ;; number of spaces to add to the indentation for `\item''s in list
;; ;; environments
;; (setq LaTeX-item-indent -2)             ; -4

;; ;; number of spaces to add to the indentation for each `{' not matched
;; ;; by a `}'
;; (setq TeX-brace-indent-level 2)         ; 4

;; ;; auto-indentation (suggested by the AUCTeX manual -- instead of adding
;; ;; a local key binding to `RET' in the `LaTeX-mode-hook')
;; (setq TeX-newline-function 'newline-and-indent)

;; ;; don't show output of TeX compilation in other window
;;                                         ;(setq TeX-show-compilation nil)

;; ;; Directory containing automatically generated TeX information.
;; ;; Must end with a slash
;; ;;(setq TeX-auto-global "~/.emacs.d/auctex-auto-generated-info/")
;; ;;(setq TeX-auto-local  "~/.emacs.d/auctex-auto-generated-info/")

;; ;; RefTex: manage cross references, bibliographies, indices, document navigation
;; ;; and a few other things
;; ;; see http://www.emacswiki.org/emacs/RefTeX
;; (require 'reftex)

;; ;; make a LaTeX reference (to a label) by pressing `C-c )'
;; ;; insert a label by pressing `C-c (' (or `C-('
;; ;; insert a citation by pressing `C-c [' (or `C-['

;; ;; hit `C-c ='; the buffer will split into 2 and in the top half you
;; ;; will see a TOC, hitting `l' there will show all the labels and cites.

;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
;; (setq reftex-plug-into-AUCTeX t)
