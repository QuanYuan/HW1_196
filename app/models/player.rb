class Player < ActiveRecord::Base
  belongs_to :team
  attr_accessible :name, :number, :team_id

  def team_name
    team.name if team
  end
end
