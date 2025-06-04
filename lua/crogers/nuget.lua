local Job = require('plenary.job');


local function run_command(command, args, on_stdout, on_stderr)
  Job:new({
    command = command,
    args = args,
    on_stdout = on_stdout,
    on_stderr = on_stderr,
    cwd = vim.fn.getcwd(), -- Set the current directory as the working directory
  }):start()
end

-- Function to list installed NuGet packages
local function list_installed_packages(callback)
  run_command('dotnet', { 'list', 'package' }, callback, function(err)
    print("Error: " .. err)
  end)
end

-- Function to search NuGet packages
local function search_nuget_packages(query, callback)
  run_command('dotnet', { 'add', 'package', query }, callback, function(err)
    print("Error: " .. err)
  end)
end

-- Function to check for updates to installed NuGet packages
local function check_for_updates(callback)
  run_command('dotnet', { 'list', 'package', '--outdated' }, callback, function(err)
    print("Error: " .. err)
  end)
end

local telescope = require('telescope.builtin')

local function search_nuget()
  local query = vim.fn.input("Search NuGet: ")
  search_nuget_packages(query, function(output)
    local results = {}
    -- Parse the output of the search command and add it to the results
    for line in output:gmatch("[^\r\n]+") do
      table.insert(results, line)
    end
    telescope.pickers.new({}, {
      prompt_title = "NuGet Package Search",
      finder = telescope.finders.new_table({
        results = results,
        entry_maker = function(entry)
          return { value = entry, display = entry, ordinal = entry }
        end,
      }),
      sorter = telescope.sorters.get_fuzzy_file(),
    }):find()
  end)
end

local function list_installed()
  list_installed_packages(function(output)
    local results = {}
    for line in output:gmatch("[^\r\n]+") do
      table.insert(results, line)
    end
    telescope.pickers.new({}, {
      prompt_title = "Installed NuGet Packages",
      finder = telescope.finders.new_table({
        results = results,
        entry_maker = function(entry)
          return { value = entry, display = entry, ordinal = entry }
        end,
      }),
      sorter = telescope.sorters.get_fuzzy_file(),
    }):find()
  end)
end

return {
  installed = list_installed
}
