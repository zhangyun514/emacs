;;关闭侧滚动条
(set-scroll-bar-mode nil)
;;关闭启动画面
(setq inhibit-startup-message t)
;;关闭工具栏
(tool-bar-mode -1)
;;设置鼠标样式
(setq-default cursor-type 'bar)
;;高亮显示当前行 
(global-hl-line-mode t)
;;启动时全屏
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))
(provide 'init-ui)
