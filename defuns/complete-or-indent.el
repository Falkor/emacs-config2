;; complement or indent on TAB=C-i
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

