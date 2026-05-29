return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',

    config = function()
	require'nvim-treesitter'.setup {
	    install_dir = vim.fn.stdpath('data') .. '/site'
    }

	require('nvim-treesitter').install {
	    'sh',
	    'bash',
	    'lua',
	    'javascript',
	    'python',
    }

	vim.api.nvim_create_autocmd('FileType', {
	    pattern = { 'sh', 'lua', 'bash', 'javascript', 'python' },
	    callback = function() 
		vim.treesitter.start()
	    end,
    })

	vim.api.nvim_create_autocmd('FileType', {
	    pattern = { 'sh', 'lua', 'bash', 'javascript', 'python' },
	    callback = function() 
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	    end,
    })


end,
   
}
    
