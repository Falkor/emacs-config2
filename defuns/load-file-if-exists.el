(defun load-file-if-exists (file)
  "Load the lisp file FILE only if the file exists"
  (if (file-exists-p file) (load-file file)))
