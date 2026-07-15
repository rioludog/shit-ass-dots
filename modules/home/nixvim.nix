{
    programs.nixvim = {
      enable = true;

      plugins = {
          bufferline.enable = true;
	        lualine.enable = true;
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
