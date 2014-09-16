;; === Word count ===
                                        ;(defun word-count nil 
                                        ;  "Count words in buffer" 
                                        ;  (interactive)
                                        ;  (shell-command-on-region (point-min) (point-max) "wc -w"))

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

;; === find a word definition === 
(defun word-definition-lookup ()
  "Look up the word under cursor in a browser."
  (interactive)
  (browse-url
   (concat "http://www.answers.com/main/ntquery?s="
           (thing-at-point 'word))))

