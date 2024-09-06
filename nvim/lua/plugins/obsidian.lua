require("obsidian").setup({
  workspaces = {
    {
      name = "Notes",
      path = os.getenv("HOME") .. "/Obsidian/Notes",
    },
  },
})
