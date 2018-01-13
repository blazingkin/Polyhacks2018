module ApplicationHelper

    def format_time(time)
        return '' if time.nil?
        time.strftime('%b %e %I:%M %p')
    end

end
