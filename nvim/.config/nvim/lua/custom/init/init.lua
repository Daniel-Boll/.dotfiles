---> Init Telescope Extensions <---

local present, telescope = pcall(require, "telescope")

if not present then
  return
end

telescope.load_extension("themes")
telescope.load_extension("terms")
telescope.load_extension("ui-select")
telescope.load_extension("media_files")
