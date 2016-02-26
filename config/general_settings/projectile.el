;; -*- mode: lisp; -*-
;; ----------------------------------------------------------------------
;; File: projectile.el - Manage projects via projectile
;; Time-stamp: <Mar 2015-01-20 12:03 svarrette>
;;
;; Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
;; ----------------------------------------------------------------------


(setq projectile-keymap-prefix (kbd "C-c p"))

(use-package projectile
  :diminish " P"
  :init
  (progn
    (setq projectile-cache-file (get-conf-path ".projectile.cache"))
    (setq projectile-known-projects-file (get-conf-path ".projectile-bookmarks.eld")))
  :config
  (progn
    (projectile-global-mode t)
    (setq projectile-enable-caching nil)
    ;;(setq projectile-require-project-root nil)
    (setq projectile-completion-system 'default)
    ;;(setq projectile-completion-system 'ido)
    ;;(setq projectile-switch-project-action 'projectile-dired)
    ;;(setq projectile-switch-project-action 'projectile-find-dir)
    (setq projectile-switch-project-action 'projectile-find-file)
    (add-to-list 'projectile-globally-ignored-files
                 ".DS_Store")))

(use-package helm-projectile
  :config (setq projectile-completion-system 'helm)
  :bind (("C-c p h" . helm-projectile)
         ("C-x C-p" . helm-projectile)))
