class TableviewerController < ApplicationController
    def index
      @activities = Activity.all
    end
end
