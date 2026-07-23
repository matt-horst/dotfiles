MOD = "SUPER"

local function require_config_files()
    local prefix = "config"
    local handle = io.popen("ls " .. os.getenv("HOME") .. "/.config/hypr/" .. prefix)

    if handle then
        for filename in handle:lines() do
            local file = prefix .. "." .. filename:gsub(".lua", "")
            require(file)
        end

        handle:close()
    end

    return {}
end

require_config_files()
