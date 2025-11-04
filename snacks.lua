-- lazy.nvim setup
return {
	"folke/snacks.nvim",
	opts = {
		dashboard = {
			formats = {
				header = { "%s", align = "left" },
			},

			preset = {
				header = [[

                       ###
               ###                 ::
               #:#                 ##
                               :::   #
         #.#           ДДДДД           :.:
         ###           :%%%:             #
                   #           :
                 #%%                   .%.
                  ::           %%%
                               :::

        ]],

				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },

				{
					pane = 2,
					icon = " ",
					title = "Repositories",
					section = "projects",
					indent = 2,
					padding = 1,
					limit = 10,
				},
				function()
					local in_git = Snacks.git.get_root() ~= nil
					local cmds = {
						{
							title = "Notifications",
							cmd = "gh notify -s -a -n5",
							action = function()
								vim.ui.open("https://github.com/notifications")
							end,
							key = "n",
							icon = " ",
							height = 11,
							enabled = true,
						},
						{
							title = "Status",
							cmd = "gh status",
							icon = "",
							height = 5,
							enabled = true,
						},
					}
					return vim.tbl_map(function(cmd)
						return vim.tbl_extend("force", {
							pane = 2,
							section = "terminal",
							enabled = in_git,
							padding = 1,
							ttl = 5 * 60,
							indent = 3,
						}, cmd)
					end, cmds)
				end,
				{ section = "startup" },
			},
		},
	},
}
