module Log
    extend self

    def info(str : String) : Void
        puts "[INFO]:  #{str}"
    end

    def warn(str : String) : Void
        puts "[WARN]:  #{str}"
    end

    def error(str : String) : Void
        puts "[ERROR]: #{str}"
    end

end
