local au = require('au')

vim.cmd{cmd = 'set', args = {'nocompatible'}}
vim.cmd{cmd = 'filetype', args = {'plugin', 'on'}}
vim.cmd{cmd = 'syntax', args = {'on'}}
-- vim.cmd{cmd = 'echo', args = {'"Hello"'}}

local header = [[
---
title: {title}
description: {description}
date: {date}
tags: {tags}
---
]]

function make_frontmatter(title, description, date, tags)
    local frontmatter = header
    frontmatter = frontmatter:gsub("{title}", title)
    frontmatter = frontmatter:gsub("{description}", description)
    frontmatter = frontmatter:gsub("{date}", date)
    frontmatter = frontmatter:gsub("{tags}", tags)
    return frontmatter
end

local date = os.date("%Y-%m-%d")
-- print(make_frontmatter("Test title", "Test description", date, "test, tags"))

function makething()
    local s = "Hello, world!"
    print(s)
end


