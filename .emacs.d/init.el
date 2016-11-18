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
(use-package helm-ls-git)
(use-package magit)
(use-package ranger)
(use-package markdown-mode)
(use-package popup-imenu)

(setq scala-indent:use-javadoc-style t)

(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-d") #'helm-browse-project)
(helm-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (popup-imenu markdown-mode ranger use-package magit helm ensime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun git-grep-dired (repo wildcards regexp)
  "Find Git-controlled files in DIR with a name like WILDCARDS containing a regexp REGEXP and start Dired on output."
  (interactive "DGit-grep (directory): \nsGit-grep (filename wildcard(s), e.g. *.xml): \nsGit-grep (grep regexp): ")
  (setq repo (file-name-as-directory (expand-file-name repo)))
  (switch-to-buffer (concat "*Git Grep " repo "*"))
  (fundamental-mode)
  (setq buffer-read-only nil)
  (erase-buffer)
  (setq default-directory repo)
  (let ((cmd (format "git --git-dir %s/.git ls-files -z%s | xargs -0 grep -lZ -- %s | xargs -0 ls -l"
                     repo
                     (apply 'concat (mapcar (lambda (s) (concat " " (shell-quote-argument s))) (split-string wildcards)))
                     (shell-quote-argument regexp))))
    (insert " " cmd "\n " repo ":\n")
    (call-process-shell-command (concat cmd " | sed -e 's/^/ /g'") nil t))
  (dired-mode)

  ;; (dired-build-subdir-alist)
  ;; From find-dired:
  ;; Set subdir-alist so that Tree Dired will work:
  (if (fboundp 'dired-simple-subdir-alist)
      ;; will work even with nested dired format (dired-nstd.el,v 1.15
      ;; and later)
      (dired-simple-subdir-alist)
    ;; else we have an ancient tree dired (or classic dired, where
    ;; this does no harm)
    (set (make-local-variable 'dired-subdir-alist)
         (list (cons default-directory (point-min-marker)))))
  (goto-line 2))
