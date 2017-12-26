;; ========== Configuring Emacs behavior ==========
;; Try to auto split vertically all the time
(setq split-height-threshold nil)
(add-hook 'emacs-startup-hook (lambda () (split-window-right) ))
(add-to-list 'default-frame-alist (cons 'width 150))
(add-to-list 'default-frame-alist (cons 'height 50))

;; Display size in human format in Dired mode
(setq dired-listing-switches "-alh")

;;Turn on ESS at start up
;;(require 'ess-site)

;; Fontify code in code blocks
(setq org-src-fontify-natively t)

;; active Babel languages
(org-babel-do-load-languages
'org-babel-load-languages
'(
   (R . t)             ;;Turn on R
   (sh . t)            ;;Turn on shell script
   (emacs-lisp . t)    ;;Turn on emacs-lisps
   (python . t)        ;;Turn on python
   )
)

;; Turning on markdown major mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))



;; adding python
(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    flycheck
    material-theme
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)




;; customization

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(setq make-backup-files nil) ;; remove backup files
(line-number-mode 1);; show line number
