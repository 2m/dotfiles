;; global variables
(setq
  inhibit-startup-screen t
  create-lockfiles nil
  make-backup-files nil
  column-number-mode t
  scroll-error-top-bottom t
  show-paren-delay 0.5
  use-package-always-ensure t
  sentence-end-double-space nil
  lazy-highlight-cleanup nil
  lazy-highlight-max-at-a-time nil
  lazy-highlight-initial-delay 0)

;; buffer local variables
(setq-default
  indent-tabs-mode nil
  tab-width 4
  c-basic-offset 4)

;; modes
(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; global magit
(global-set-key (kbd "C-x g") 'magit-status)

;; the package manager
(require 'package)
(setq
  package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                      ("org" . "http://orgmode.org/elpa/")
                      ("melpa" . "http://melpa.org/packages/")
                      ("melpa-stable" . "http://stable.melpa.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
    (package-install 'use-package))
(require 'use-package)

(use-package ensime
  :pin melpa-stable)
(use-package helm)
(use-package magit)
