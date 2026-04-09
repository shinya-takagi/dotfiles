return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      fortls = {
        cmd = {
          "fortls",
          "--lowercase_intrinsics", -- Lowercase intrinsics
          "--hover_signature",
          "--hover_language=fortran",
        },
      },
    },
  },
}

