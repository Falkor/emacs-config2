;; -*- mode: lisp; -*-


;; Helper to apply a given function to set of modes
;; Example of usage:
;; (hook-into-modes #'(lambda () (yas-minor-mode 1))
;;                   '(prog-mode-hook
;;                     org-mode-hook
;;                     ruby-mode-hook))

(defmacro hook-into-modes (func modes)
  `(dolist (mode-hook ,modes)
     (add-hook mode-hook ,func)))



;; As the name indicates...
(defun load-file-if-exists (file)
  "Load the lisp file FILE only if the file exists"
  (if (file-exists-p file) (load-file file)))



;; to activate or not ECB
(defun ecb-toggle ()
  "Activate (or desactivate) Emacs Code Browser (ECB)"
  (interactive)
  (if ecb-minor-mode
      (ecb-deactivate)
    (ecb-activate)))

;; Courtesy of Evan Sultanik (http://www.sultanik.com/Word_count_in_Emacs)
;; quote: "I wrote a relatively simple (and equally lazy) Emacs Lisp function to
;;         calculate word length. It even strips LaTeX files of their commands!"
(defun word-count (&optional filename)
  "Returns the word count of the current buffer.  If `filename' is not nil, returns the word count of that file."
  (interactive)
  (save-some-buffers) ;; Make sure the current buffer is saved
  (let ((tempfile nil))
    (if (null filename)
        (progn
          (let ((buffer-file (buffer-file-name))
                (lcase-file (downcase (buffer-file-name))))
            (if (and (>= (length lcase-file) 4) (string= (substring lcase-file -4 nil) ".tex"))
                ;; This is a LaTeX document, so DeTeX it!
                (progn
                  (setq filename (make-temp-file "wordcount"))
                  (shell-command-to-string (concat "detex < " buffer-file " > " filename))
                  (setq tempfile t))
              (setq filename buffer-file)))))
    (let ((result (car (split-string (shell-command-to-string (concat "wc -w " filename)) " "))))
      (if tempfile
          (delete-file filename))
      (message (concat "Word Count: " result))
      )))


(defun th-complete-or-indent (arg)
  "If preceding character is a word character and the following character is a whitespace or non-word character, then
  `dabbrev-expand', else indent according to mode."
  (interactive "*P")
  (cond ((and
          (= (char-syntax (preceding-char)) ?w)
          (looking-at (rx (or word-end (any ".,;:#=?()[]{}")))))
         (require 'sort)
         (let ((case-fold-search t))
           (dabbrev-expand arg)))
        (t
         (indent-according-to-mode))))

;; See http://www.emacswiki.org/emacs/ExecuteExternalCommand
(defun execvp (&rest args)
    "Simulate C's execvp() function.
  Quote each argument seperately, join with spaces and call shell-command-to-string to run in a shell."
    (let ((cmd (mapconcat 'shell-quote-argument args " ")))
          (shell-command-to-string cmd)))




(provide 'falkor/core/utils)
