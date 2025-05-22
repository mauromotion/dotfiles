;; -*- lexical-binding: t -*-

;; Improve startup time
(setq gc-cons-threshold most-positive-fixnum)

;; Minimal UI to reduce flicker
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(setq inhibit-startup-message t
      inhibit-splash-screen t
      inhibit-startup-echo-area-message t)
