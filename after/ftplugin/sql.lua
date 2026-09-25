-- The runtime ftplugin sets sqlcomplete#Complete, which needs dbext for anything but keywords.
vim.bo.omnifunc = "vim_dadbod_completion#omni"
