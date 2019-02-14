require_relative '../config/environment'
require "pry"

module Screen
    def self.clear
        print "\e[2J\e[f"
    end
end
UserStories.intro
