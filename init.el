 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
(require 'cl)


 ;; Add Packages
 (defvar my/packages '(
		company
		monokai-theme
		hungry-delete
		swiper
		counsel
		smartparens
		js2-mode
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))
;;加载主题
(load-theme 'monokai t)
;;便捷删除空格
(require 'hungry-delete)
(global-hungry-delete-mode)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;;括号自动补齐
(require 'smartparens-config)
(smartparens-global-mode t)
;;匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;查找函数、快捷键在文件中的位置
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
;;关闭侧滚动条
(set-scroll-bar-mode nil)
;;关闭启动画面
(setq inhibit-startup-message t)
;;显示行号
(global-linum-mode t)
;;禁止生成备份文件
(setq make-backup-files nil)
;;关闭工具栏
(tool-bar-mode -1)
;;补全模式
(global-company-mode 1)
;;设置鼠标样式
(setq-default cursor-type 'bar)
;;最近使用文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;;选中后输入删除原文本
(delete-selection-mode 1)
;;高亮显示当前行 
(global-hl-line-mode t)
;;启动时全屏
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))
