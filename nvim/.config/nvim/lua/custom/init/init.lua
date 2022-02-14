---> Init Telescope Extensions <---

local present, telescope = pcall(require, "telescope")
if not present then
  return
end

local extensions = { "themes", "terms", "fzf", "ui-select", "media_files" }

-- Load all extensions through the `telescope.load_extension` function
for _, ext in ipairs(extensions) do
  telescope.load_extension(ext)
end
