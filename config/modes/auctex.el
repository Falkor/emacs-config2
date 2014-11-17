;; -*- mode: lisp; -*-
;; === LaTeX ===

;; Does not work ;(
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

;; ------------------
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
	(use-package auto-complete-auctex)
    (add-hook 'LaTeX-mode-hook
              (lambda ()
                (visual-line-mode t)
                (LaTeX-math-mode)
				(setq TeX-master nil)
				(setq LaTeX-command "pdflatex -synctex=1")
				;;(setq TeX-master (guess-TeX-master (buffer-file-name)))
                ;; RefTex: manage cross references, bibliographies, indices, document navigation
                ;; and a few other things
                ;; see http://www.emacswiki.org/emacs/RefTeX
                (turn-on-reftex)))
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

;; (use-package latex-extra
;;   :init
;;   (progn
;; 	(add-hook 'LaTeX-mode-hook #'latex-extra-mode)
;; 	;; turn off auto-fill-mode, one can turn on it manually
;; 	(add-hook 'latex-extra-mode-hook (lambda () (auto-fill-mode -1)) t)))







;; ;; make a LaTeX reference (to a label) by pressing `C-c )'
;; ;; insert a label by pressing `C-c (' (or `C-('
;; ;; insert a citation by pressing `C-c [' (or `C-['

;; ;; hit `C-c ='; the buffer will split into 2 and in the top half you
;; ;; will see a TOC, hitting `l' there will show all the labels and cites.

;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
;; (setq reftex-plug-into-AUCTeX t)
