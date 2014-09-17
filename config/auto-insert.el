;; ========================================================
;; Auto-insert: automatic insertion of text into new files
;; ========================================================

(require 'auto-insert-tkld)    ; see ~/.emacs.d/site-lisp/auto-insert-tkld.el
;; doc:  ~/.emacs.d/site-lisp/auto-insert-tkld.pdf
(setq auto-insert-path (cons (concat emacs-root "auto-insert") auto-insert-path))
;; trick to abstract the personal web page
;;(setq auto-insert-organisation  user-www)
(setq auto-insert-automatically t)
;; associate file extention to a template name
(setq auto-insert-alist
      '(
        ("\\.tex$"         . "LaTeX")            ; TeX or LaTeX
        ("\\.bib$"         . "BibTeX")           ; BibTeX
        ("\\.sty$"         . "LaTeX Style")      ; LaTeX Style
        ("\\.el$"          . "Emacs Lisp")       ; Emacs Lisp
        ("\\.java$"        . "Java")             ; Java
        ("\\App.java$"     . "JavaSwing")        ; Java Swing app
        ("[Tt]ools.h"      . "Tools C++")        ; Useful functions in C/C++
        ("\\Logs.cpp"      . "Logs C++")         ; Macros for logs/debugging
        ("\\Logs.h[+p]*"   . "Logs C++ Include") ; " header file
        ("\\.c$"           . "C")                ; C
        ("\\.h$"           . "C Include")        ; C header file
        ("\\.cxx$"         . "C++")              ; C++
        ("\\.c\\+\\+$"     . "C++")              ;
        ("\\.cpp$"         . "C++")              ;
        ("\\.cc$"          . "C++")              ;
        ("\\.C$"           . "C++")              ;
        ("[Mm]akefile$"    . "Makefile")         ; Makefile
        ("[Mm]akefile.am$" . "Makefile.am")      ; Makefile.am (Automake)
        ("\\.md$"          . "Text")             ; Text
        ("\\.txt$"         . "Text")             ; Text
        ("\\.gpg$"         . "GPG")              ; GPG 
        ("[Rr]eadme$"      . "Readme")           ; Readme
        ("README$"         . "Readme")           ;
        ("\\.sh$"          . "Shell")            ; Shell
        ("\\.csh$"         . "Shell")            ;
        ("\\.tcsh$"        . "Shell")            ;
        ("\\.html"         . "Html")             ; HTML
        ("\\.wml"          . "WML")              ; WML (Website Meta Language)
        ("\\.php"          . "PHP")              ; PHP
        ("\\.gnuplot"      . "Gnuplot")          ; Gnuplot
        ("\\.pl$"          . "Perl")             ; Perl
        ("\\.pm$"          . "Perl Module")      ; PerlModule
        ("\\.t$"           . "Perl Test")        ; Perl Test script
        ("\\.pp$"          . "Puppet")           ; Puppet manifest
        ("\\.rb$"          . "Ruby")             ; Ruby
        ("\\.R$"           . "R")                ; R
        ("\\.admission_rule[s]?$" . "OAR")              ; OAR admission rule
        (""                . "Shell") ; Shell (by default: assume a shell template)
        ))
;; now associate a template name to a template file
(setq auto-insert-type-alist
      '(
        ("LaTeX"       . "insert.tex")
        ("BibTeX"      . "insert.bib")
        ("LaTeX Style" . "insert.sty")
        ("Emacs Lisp"  . "insert.el")
        ("Java"        . "insert.java")
        ("JavaSwing"   . "insertApp.java")
        ("C"           . "insert.c")
        ("C Include"   . "insert.h")
        ("C++"         . "insert.cpp")
        ("Tools C++"   . "insert.tools_cpp.h")
        ("Logs C++"    . "insert.logs.cpp")
        ("Logs C++ Include" . "insert.logs.h")
        ("Makefile"    . "insert.makefile")
        ("Makefile.am" . "insert.makefile.am")
        ("Text"        . "insert.md")
        ("GPG"         . "insert.gpg")
        ("Readme"      . "insert.readme")
        ("Shell"       . "insert.shell")
        ("Html"        . "insert.html")
        ("WML"         . "insert.wml")
        ("PHP"         . "insert.php")
        ("Gnuplot"     . "insert.gnuplot")
        ("Perl"        . "insert.pl")
        ("Perl Module" . "insert.pm")
        ("Perl Test"   . "insert.t")
        ("Puppet"      . "insert.pp")
        ("Ruby"        . "insert.rb")
        ("R"           . "insert.R")
        ("OAR"         . "insert.oar")
        ))

