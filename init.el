
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elisp_file")
(require 'init-package)

;;匹配括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

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

;;禁止生成备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)

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
