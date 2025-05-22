;; init.el — bootstrap and load your literate config
;; -*- lexical-binding: t; -*-

;; 1) Early‐init tweaks live in early-init.el

;; 2) Startup Performance
(setq gc-cons-threshold (* 50 1000 1000))

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
(let ((mmotion/config-org
       (locate-user-emacs-file "config.org")))
  (when (file-exists-p mmotion/config-org)
    (org-babel-load-file mmotion/config-org)))
