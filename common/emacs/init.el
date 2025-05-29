;; -*- lexical-binding: t; -*-

;; init.el — bootstrap and load your literate config

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9"
     default))
 '(package-selected-packages
   '(auto-package-update cape colorful-mode consult-org-roam
                         consult-projectile corfu dashboard
                         dired-hide-dotfiles dired-open doom-modeline
                         doom-themes doric-themes ef-themes
                         embark-consult evil-collection evil-goggles
                         evil-nerd-commenter evil-org flycheck
                         flyspell-correct helpful hl-todo indent-bars
                         lsp-treemacs lsp-ui magit marginalia
                         nerd-icons-completion nerd-icons-dired
                         no-littering olivetti orderless org-download
                         org-fancy-priorities org-modern org-roam-ui
                         org-superstar rainbow-delimiters toc-org
                         undo-fu undo-fu-session vertico vterm-toggle)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))
