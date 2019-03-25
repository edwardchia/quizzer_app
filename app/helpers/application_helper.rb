module ApplicationHelper

    def flash_class(level)
        case level
            when "danger" then "danger"
            when "alert" then "danger"
            when "notice" then "info"
            when "success" then "success"
            when "error" then "error"
            when "alert" then "danger"
        end
    end

end
