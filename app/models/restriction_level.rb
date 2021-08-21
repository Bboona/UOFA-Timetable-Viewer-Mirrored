class RestrictionLevel < ApplicationRecord

  def self.all_levels
    {'0'=>['No restrictions'],
     '1: Watch and assess'=>['3/4 density (3 people per 4 square metres)','Indoor venues: masks if more than 3/4 density','No communal consumption facilities'],
     '2: Low restrictions'=>['1/2 density (1 person per 2 square metres)', 'Indoor venues: masks if more than 1/2 density','No communal consumption facilities','Covid Management Plan: events of more than 1,000 people','Shisha ban','Masks for high risk settings','Masks for personal care services','Restrictions on dancing and singing','Private activity cap: 150'],
     '3: Medium restrictions'=>['1/4 density (1 person per 4 square metres)', 'No communal consumption facilities', 'Seated food and beverage consumption only', 'Covid Management Plan: events of more than 1,000 people and outdoors only', 'Shisha ban', 'Private activity cap: 50', 'Masks for high risk settings', 'Masks for personal care services', 'Masks for passenger transport services', 'Restrictions on dancing and singing', 'Sports spectator restrictions'],
     '4: High restrictions'=>['1/4 density (1 person per 4 square metres)', 'Outdoor dining only', 'No communal consumption facilities', 'Seated food and beverage consumption only', 'No Covid Management Plan events', 'Shisha ban', 'Private activity cap: 10', 'Masks for high risk settings', 'Masks for health care services', 'Masks for passenger transport services', 'Masks for shared indoor public places', 'Restrictions on dancing and singing', 'Sports spectator restrictions', 'Indoor fitness facilities closed', 'No team, club or competitive sport', 'Personal care services closed', 'Public entertainment closed', 'Non-essential retail services closed'],
     '5: Stay at home'=>['Stay at home requirement', 'Closure of community activities', 'Masks for high risk settings', 'Masks for health care services', 'Masks for passenger transport services', 'Masks for public places']}
  end
end
