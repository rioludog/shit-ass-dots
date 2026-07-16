{
    programs.nixvim = {
      enable = true;

      plugins = {
          bufferline.enable = true;
	        lualine.enable = true;
	        mini-pairs.enable = true;
	        mini-snippets.enable = true;
	        mini-icons.enable = true;
	        mini-basics = {
	          enable = true;
	          settings = {
              move_with_alt = true;
	          };
	        };
	        mini-cursorword.enable = true;
	        mini-starter.enable = true;
	        notify.enable = false;
	        mini-notify.enable = true;
	        hardtime.enable = true;

	        treesitter = {
	          enable = true;
	          settings = {
	          indent.enable = false;
	          highlight.enable = true;
	          };
	        };

	        blink-cmp = {
	          enable = true;
	          setupLspCapabilities = true;
	          settings = {
	            completion = {
	              documentation.auto_show = true;
	            };
	          #  sources.default = [ "lsp" "path" "snippets" ];
	          #  signature.enabled = true;
	            keymap.preset = "super-tab";
	          };
	        };
        };
      opts = {
      	number = true;
	      relativenumber = true;
	      cursorline = true;
	      signcolumn = "yes";
	      showmode = true;
	      termguicolors = true;

	      incsearch = true;
	      ignorecase = true;
	      smartcase = true;
	      hlsearch = true;

	      tabstop = 2;
	      shiftwidth = 2;
	      expandtab = true;
      	autoindent = true;
	      breakindent = true;
      	copyindent = true;
	      preserveindent = true;
	      linebreak = true;
	      wrap = true;

	      pumheight = 10;
	      infercase = true;

      	cmdheight = 0;
      	history = 100;

      	virtualedit = "block";
      	startofline = true;
      	title = true;
      };
    };
  }
