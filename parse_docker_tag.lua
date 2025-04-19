function parse_docker_tag(tag, timestamp, record)
    local attrs = record["attrs"]
    if attrs == nil or attrs["tag"] == nil then
        return 1, timestamp, record
    end

    local tag_str = attrs["tag"]

    if record["docker"] == nil then
        record["docker"] = {}
    end

    for entry in string.gmatch(tag_str, "[^,]+") do
        local trimmed = string.gsub(entry, "^%s*(.-)%s*$", "%1")
        local key, value = string.match(trimmed, "([^=]+)=([^=]+)")
        if key and value then
            record["docker"][key] = value
        end
    end

    local level = record["level"]
    if level ~= nil then
        record["level"] = string.upper(level)
    end

    return 1, timestamp, record
end
