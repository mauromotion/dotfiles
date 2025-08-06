;; -*- lexical-binding: t; -*-

;; init.el — bootstrap and load your literate config

;; 1) Early‐init tweaks live in early-init.el

;; 2) Startup Performance
(setq gc-cons-threshold (* 50 1000 1000))

;; Redirect Emacs customizations to a machine-local file
(setq custom-file (expand-file-name "var/custom.el"
  (expand-file-name "emacs"
    (or (getenv "XDG_CACHE_HOME") "~/.cache"))))

;; Load customizations if the file exists
(when (file-exists-p custom-file)
  (load custom-file))

(defun mmotion/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))
(add-hook 'emacs-startup-hook #'mmotion/display-startup-time)

;; 3) Package bootstrap (package.el, use-package, etc.)
(require 'package)

(setq package-archives
      '(("melpa"  . "https://melpa.org/packages/")
        ("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)

;; Only refresh and install `use-package` if it's missing:
(unless (package-installed-p 'use-package)
  (message "Bootstrapping use-package…")
  (package-refresh-contents)
  (package-install    'use-package))

;; Make sure `use-package` is loaded for the rest of the init:
(eval-when-compile
  (require 'use-package))

;; Optional: auto-ensure all packages declared below
(setq use-package-always-ensure t
      use-package-verbose t)

;; 4) Tangle and load config.org in one step:
(defconst mmotion/config-org
  (file-truename (expand-file-name "config.org" user-emacs-directory))
  "Path to my literate org config.")

;; Ensure Org and Babel are ready
(use-package org
  :ensure t
  :config
  (require 'ob-tangle))

;; Initial load of config.org
(when (file-exists-p mmotion/config-org)
  (org-babel-load-file mmotion/config-org))

;; 5) Auto-reload literate config on save
(defun mmotion/reload-literate-config ()
  "Tangle and load my `config.org` when it is saved."
  (interactive)
  (org-babel-load-file mmotion/config-org))

(add-hook 'after-save-hook
          (lambda ()
            (when (and buffer-file-name
                       (string= (file-truename buffer-file-name)
                                mmotion/config-org))
              (mmotion/reload-literate-config))))
