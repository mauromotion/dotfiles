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
(let ((mmotion/config-org (file-truename (expand-file-name "config.org" user-emacs-directory))))
  (when (file-exists-p mmotion/config-org)
    (org-babel-load-file mmotion/config-org)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(auto-package-update cape colorful-mode consult-org-roam
                         consult-projectile corfu dashboard
                         dired-hide-dotfiles dired-open doom-modeline
                         doom-themes ef-themes embark-consult
                         evil-collection evil-goggles
                         evil-nerd-commenter evil-org flycheck
                         flyspell-correct helpful indent-bars
                         lsp-treemacs lsp-ui magit marginalia
                         nerd-icons-completion nerd-icons-dired
                         no-littering olivetti orderless org-download
                         org-fancy-priorities org-modern org-roam-ui
                         org-superstar rainbow-delimiters rainbow-mode
                         toc-org undo-tree vertico vterm-toggle)))
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
