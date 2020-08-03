class PagesController < ApplicationController
  def home
    @due_dates = DueDate.order("start_date asc, end_date asc, type_of_project desc")
    @declarations_by_due_date = []
    @due_dates.each do |due_date|
      if due_date.statutory_due_date.after? Date.today()
        due_date.declarations != [] ? @declarations_by_due_date << due_date.declarations : ""
      end
    end
  end
end
