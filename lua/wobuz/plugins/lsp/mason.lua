local status, masn = pcall(require, 'mason')
if not status then
    vim.notify("mason not found")
    return
end
masn.setup()
