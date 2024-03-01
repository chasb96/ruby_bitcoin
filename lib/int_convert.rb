def bytes_to_int(bytes)
    result = 0

    for b in bytes
        result = (result << 8) + b
    end

    return result
end